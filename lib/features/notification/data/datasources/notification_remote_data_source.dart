import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/notification/data/models/notification_model.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();

  Future<NotificationModel> createNotification(
    CreateNotificationParams params,
  );

  Future<void> readNotification(String id);

  Future<void> readAllNotifications();
}

class NotificationRemoteDataSourceImpl
    implements NotificationRemoteDataSource {
  const NotificationRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<NotificationModel>
  get _notificationsCollection => _firestore
      .collection('notifications')
      .withConverter<NotificationModel>(
        fromFirestore: (snapshot, _) =>
            NotificationModel.fromJson(snapshot.data()!),
        toFirestore: (notification, _) => notification.toJson(),
      );

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('User not sign in');
    }

    final snapshot = await _notificationsCollection
        .where('receiverId', isEqualTo: currentUser.uid)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<NotificationModel> createNotification(
    CreateNotificationParams params,
  ) async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('User not sign in');
    }

    try {
      final docRef = _notificationsCollection.doc();

      final notification = NotificationModel(
        id: docRef.id,
        receiverId: params.receiverId,
        title: params.title,
        body: params.body,
        type: params.type,
        data: params.data,
        createdAt: DateTime.now(),
      );

      await docRef.set(notification);

      return notification;
    } catch (e) {
      throw ServerException('Create notification failed: $e');
    }
  }

  @override
  Future<void> readNotification(String id) async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('User not sign in');
    }

    try {
      await _notificationsCollection.doc(id).update({'isRead': true});
    } catch (e) {
      throw ServerException('Update notification failed: $e');
    }
  }

  @override
  Future<void> readAllNotifications() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('User not sign in');
    }

    try {
      final snapshot = await _notificationsCollection
          .where('receiverId', isEqualTo: currentUser.uid)
          .where('isRead', isEqualTo: false)
          .get();

      if (snapshot.docs.isEmpty) return;

      final batch = _firestore.batch();

      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();
    } catch (e) {
      throw ServerException('Update notification failed: $e');
    }
  }
}
