import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:myairplane/models/destination_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final DateTime creationDateTime;
  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionModel({
    this.destination = const DestinationModel(
      id: '',
      insurance: false,
      refundable: false,
      imageUrl: '',
      name: '',
      airportCity: '',
      airportCode: '',
      about: '',
      city: '',
      price: 0,
      rating: 0,
      subImageUrl1: '',
      subImageUrl2: '',
      subImageUrl3: '',
      subImageUrl4: '',
    ),
    required this.id,
    required this.creationDateTime,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });
  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    final destinationMap = json['destination'] as Map<String, dynamic>;

    return TransactionModel(
      id: id,
      destination: DestinationModel(
        id: destinationMap['id'] ?? '',
        insurance: destinationMap['insurance'] ?? false,
        refundable: destinationMap['refundable'] ?? false,
        imageUrl: destinationMap['imageUrl'] ?? '',
        name: destinationMap['name'] ?? '',
        airportCity: destinationMap['airportCity'] ?? '',
        airportCode: destinationMap['airportCode'] ?? '',
        about: destinationMap['about'] ?? '',
        city: destinationMap['city'] ?? '',
        price: destinationMap['price'] ?? 0,
        rating: destinationMap['rating'] ?? 0,
        subImageUrl1: destinationMap['subImageUrl1'] ?? '',
        subImageUrl2: destinationMap['subImageUrl2'] ?? '',
        subImageUrl3: destinationMap['subImageUrl3'] ?? '',
        subImageUrl4: destinationMap['subImageUrl4'] ?? '',
      ),
      creationDateTime: (json['creationDateTime'] as Timestamp).toDate(),
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeats: json['selectedSeats'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }
  @override
  List<Object?> get props =>
      [destination, amountOfTraveler, selectedSeats, vat, price, grandTotal];
}
