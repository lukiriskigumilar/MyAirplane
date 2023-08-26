import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String airportCity;
  final String airportCode;
  final String about;
  final double rating;
  final int price;
  final String imageUrl;
  final String subImageUrl1;
  final String subImageUrl2;
  final String subImageUrl3;
  final String subImageUrl4;

  const DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.airportCity = '',
    this.airportCode = '',
    this.about = '',
    this.rating = 0,
    this.price = 0,
    this.imageUrl = '',
    this.subImageUrl1 = '',
    this.subImageUrl2 = '',
    this.subImageUrl3 = '',
    this.subImageUrl4 = '',
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        airportCity: json['airportCity'],
        airportCode: json['airportCode'],
        about: json['about'],
        rating: json['rating'].toDouble(),
        price: json['price'],
        imageUrl: json['imageUrl'],
        subImageUrl1: json['subImageUrl1'],
        subImageUrl2: json['subImageUrl2'],
        subImageUrl3: json['subImageUrl3'],
        subImageUrl4: json['subImageUrl4'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        airportCity,
        airportCode,
        about,
        rating,
        price,
        imageUrl,
        subImageUrl1,
        subImageUrl2,
        subImageUrl3,
        subImageUrl4
      ];
}
