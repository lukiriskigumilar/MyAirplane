import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myairplane/cubit/topup_history_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';

class HistoryService {
  final CollectionReference _userHistory =
      FirebaseFirestore.instance.collection('history');

  Future<void> createHistory(HistoryTopupMOdel history) async {
    try {
      _userHistory.add({
        'id': history.id,
        'creationDateTime': history.creationDateTime,
        'parseBalance': history.parseBalance
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HistoryTopupMOdel>> fetchTopup() async {
    final users = FirebaseAuth.instance.currentUser;
    List<HistoryTopupMOdel> history = [];

    if (users != null) {
      try {
        QuerySnapshot<Object?> result =
            await _userHistory.where('id', isEqualTo: users.uid).get();

        history = result.docs.map((e) {
          return HistoryTopupMOdel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        }).toList();
      } catch (e) {
        rethrow;
      }
    }
    return history;
  }
}
