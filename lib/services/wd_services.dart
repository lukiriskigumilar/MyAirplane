import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myairplane/models/wd_model.dart';

class WdServices {
  final CollectionReference _userWd =
      FirebaseFirestore.instance.collection('wdHistory');

  Future<void> createWdHistory(WdModel wdHistory) async {
    try {
      _userWd.add({
        'idWd': wdHistory.idWd,
        'idUser': wdHistory.idUser,
        'userEmail': wdHistory.userEmail,
        'wdAmount': wdHistory.wdAmount,
        'creationDateTime': wdHistory.creationDateTime,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WdModel>> fetchWd() async {
    final users = FirebaseAuth.instance.currentUser;
    List<WdModel> wd = [];

    if (users != null) {
      try {
        QuerySnapshot<Object?> result =
            await _userWd.where('idUser', isEqualTo: users.uid).get();

        wd = result.docs.map((e) {
          return WdModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        }).toList();
      } catch (e) {
        rethrow;
      }
    }
    return wd;
  }
}
