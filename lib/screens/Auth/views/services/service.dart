import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUserIfNotExists(User user) async {
    final docRef = firestore.collection('users').doc(user.uid);
    final doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({
        'uid': user.uid,
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'phone': user.phoneNumber ?? '',
        'photo': user.photoURL ?? '',
        'provider':
            user.providerData.isNotEmpty
                ? user.providerData[0].providerId
                : 'phone',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}
