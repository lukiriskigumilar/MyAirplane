import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HistoryTopupMOdel extends Equatable {
  final String id;
  final int parseBalance;
  final DateTime creationDateTime;

  const HistoryTopupMOdel({
    required this.id,
    this.parseBalance = 0,
    required this.creationDateTime,
  });

  factory HistoryTopupMOdel.fromJson(String id, Map<String, dynamic> json) =>
      HistoryTopupMOdel(
        id: id,
        parseBalance: json['parseBalance'],
        creationDateTime: (json['creationDateTime'] as Timestamp).toDate(),
      );

  @override
  List<Object?> get props => [id, parseBalance, creationDateTime];
}
