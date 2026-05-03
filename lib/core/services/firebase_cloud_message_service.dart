import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  NotificationService({
    required FirebaseAuth auth,
    required FirebaseFirestore database,
  }) : _auth = auth,
       _firestore = database;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  void init() {
    FirebaseMessaging.instance.onTokenRefresh.listen(_saveFcmToken);
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> setFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      await _saveFcmToken(fcmToken);
    }
  }

  Future<void> _saveFcmToken(String fcmToken) async {
    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .update({'fcmToken': fcmToken});
    }
  }
}
