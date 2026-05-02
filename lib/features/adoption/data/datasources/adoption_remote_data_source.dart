import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/adoption/data/models/adoption_request_model.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

abstract class AdoptionRemoteDataSource {
  Future<List<AdoptionRequestModel>> getAdoptionRequests();
  Future<List<AdoptionRequestModel>> getUserAdoptionRequests();

  Future<AdoptionRequestModel> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  );

  Future<AdoptionRequestModel> updateAdoptionRequest(
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
        .where('petOwnerId', isEqualTo: currentUser.uid)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<List<AdoptionRequestModel>> getUserAdoptionRequests() async {
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
          petOwnerId: params.pet.uid,
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
  Future<AdoptionRequestModel> updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  ) async {
    try {
      final docRef = _adoptionRequestsCollection.doc(params.id);

      await docRef.update({
        'status': params.status.name,
        if (params.rejectionReason != null)
          'rejectionReason': params.rejectionReason,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      final updatedDoc = await docRef.get();

      if (!updatedDoc.exists) {
        throw const ServerException(
          'Yêu cầu nhận nuôi không tồn tại.',
        );
      }

      print(updatedDoc.data());

      return updatedDoc.data()!;
    } on FirebaseException catch (e) {
      print(e);
      throw ServerException('Lỗi Firebase: ${e.message}');
    } on ServerException {
      rethrow;
    } catch (e) {
      print(e);
      throw ServerException('Update adoption request failed: $e');
    }
  }
}
