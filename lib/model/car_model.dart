import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:car_rental_app/model/user_model.dart';

class CarModel {
  String? carId;
  Bool? isPublic;
  String? name;
  UserModel? owner;
  String? model;
  String? modelYear;
  Float? mileage;
  File? picture;
  Int32? rate;
  Int32? seats;
  File? documents;
  Array? bookedTimeSlots;
  Array? damages;
  Int32? capacity;
  String? transmissionType;

  CarModel(
      {this.carId,
      this.isPublic,
      this.name,
      this.owner,
      this.model,
      this.modelYear,
      this.mileage,
      this.picture,
      this.rate,
      this.seats,
      this.documents,
      this.bookedTimeSlots,
      this.damages,
      this.capacity,
      this.transmissionType});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      carId: json['carId'],
      isPublic: json['isPublic'],
      name: json['name'],
      owner: json['owner'] != null ? UserModel.fromJson(json['owner']) : null,
      model: json['model'],
      modelYear: json['modelYear'],
      mileage: json['mileage'],
      picture: json['picture'] != null ? File(json['picture']) : null,
      rate: json['rate'],
      seats: json['seats'],
      documents: json['documents'] != null ? File(json['documents']) : null,
      bookedTimeSlots: json['bookedTimeSlots'],
      damages: json['damages'],
      capacity: json['capacity'],
      transmissionType: json['transmissionType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'isPublic': isPublic,
      'name': name,
      'owner': owner,
      'model': model,
      'modelYear': modelYear,
      'mileage': mileage,
      'picture': picture,
      'rate': rate,
      'seats': seats,
      'documents': documents,
      'bookedTimeSlots': bookedTimeSlots,
      'damages': damages,
      'capacity': capacity,
      'transmissionType': transmissionType,
    };
  }
}
