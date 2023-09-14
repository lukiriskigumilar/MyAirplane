import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WdModel extends Equatable {
  final String idWd;
  final String idUser;
  final String userEmail;
  final int wdAmount;
  final DateTime creationDateTime;

  const WdModel({
    required this.idWd,
    required this.idUser,
    this.userEmail = '',
    this.wdAmount = 0,
    required this.creationDateTime,
  });

  factory WdModel.fromJson(String idWd, Map<String, dynamic> json) => WdModel(
        idWd: idWd,
        idUser: json['idUser'],
        wdAmount: json['wdAmount'],
        userEmail: json['userEmail'],
        creationDateTime: (json['creationDateTime'] as Timestamp).toDate(),
      );

  @override
  List<Object?> get props =>
      [idWd, idUser, wdAmount, userEmail, creationDateTime];
}
