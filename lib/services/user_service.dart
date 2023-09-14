import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          hobby: snapshot['hobby'],
          balance: snapshot['balance']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserBalance({
    required var id,
    required int newBalance,
  }) async {
    try {
      await _userReference.doc(id).update({
        'balance': newBalance,
      });
    } catch (e) {
      rethrow;
    }
  }
}
