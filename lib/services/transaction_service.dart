import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myairplane/models/transaction_model.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'creationDateTime': transaction.creationDateTime,
        'destination': transaction.destination.toJson(),
        'id': transaction.id,
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    final users = FirebaseAuth.instance.currentUser;
    List<TransactionModel> transactions = [];

    if (users != null) {
      try {
        QuerySnapshot<Object?> result =
            await _transactionReference.where('id', isEqualTo: users.uid).get();

        transactions = result.docs.map((e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        }).toList();
      } catch (e) {
        print('Error fetching user transactions: $e');
      }
    }
    return transactions;
  }
}
