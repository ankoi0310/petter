import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/adoption/data/models/adoption_request_model.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

abstract class AdoptionRemoteDataSource {
  Future<List<AdoptionRequestModel>> getAdoptionRequests();

  Future<AdoptionRequestModel> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  );

  Future<void> updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  );
}

class AdoptionRemoteDataSourceImpl
    implements AdoptionRemoteDataSource {
  const AdoptionRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<AdoptionRequestModel>
  get _adoptionRequestsCollection => _firestore
      .collection('adoptionRequests')
      .withConverter<AdoptionRequestModel>(
        fromFirestore: (snapshot, _) {
          return AdoptionRequestModel.fromJson(snapshot.data()!);
        },
        toFirestore: (adoptionRequest, _) => adoptionRequest.toJson(),
      );

  @override
  Future<List<AdoptionRequestModel>> getAdoptionRequests() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('User not sign in');
    }

    final snapshot = await _adoptionRequestsCollection
        .where('adopterId', isEqualTo: currentUser.uid)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<AdoptionRequestModel> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  ) async {
    try {
      final query = _adoptionRequestsCollection
          .where('petId', isEqualTo: params.pet.id)
          .where('adopterId', isEqualTo: params.adopter.id)
          .where(
            'status',
            whereIn: ['pending', 'reviewing', 'approved'],
          );

      return await _firestore.runTransaction((transaction) async {
        final snapshot = await query.get();

        if (snapshot.docs.isNotEmpty) {
          throw const ServerException(
            'Bạn đã tạo yêu cầu cho thú cưng này rồi',
          );
        }

        final adoptionReqRef = _adoptionRequestsCollection.doc();
        final request = AdoptionRequestModel(
          id: adoptionReqRef.id,
          petId: params.pet.id,
          petName: params.pet.name,
          petImageUrl: params.pet.imageUrl,
          adopterId: params.adopter.id,
          adopterName: params.adopter.name,
          adopterAvatar: params.adopter.avatar,
          adopterPhone: params.adopter.phone,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        transaction.set(adoptionReqRef, request);

        return request;
      });
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Create adoption request failed: $e');
    }
  }

  @override
  Future<void> updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  ) async {
    try {
      await _adoptionRequestsCollection.doc(params.id).update({
        'status': params.status,
        if (params.rejectionReason != null)
          'rejectionReason': params.rejectionReason,
      });
    } catch (e) {
      throw ServerException('Update adoption request failed: $e');
    }
  }
}
