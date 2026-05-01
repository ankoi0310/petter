import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/adoption/data/models/adoption_request_model.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

abstract class AdoptionRemoteDataSource {
  Future<AdoptionRequestModel> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  );

  Future<void> updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  );
}

class AdoptionRemoteDataSourceImpl
    implements AdoptionRemoteDataSource {
  const AdoptionRemoteDataSourceImpl(this._firestore);

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
  Future<AdoptionRequestModel> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  ) async {
    try {
      final adoptionReqRef = _adoptionRequestsCollection.doc();

      final newRequest = AdoptionRequestModel(
        id: adoptionReqRef.id,
        petId: params.petId,
        adopterId: params.adopterId,
        createAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await adoptionReqRef.set(newRequest);

      return newRequest;
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
