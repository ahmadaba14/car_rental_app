import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'user_model.dart';
import 'car_model.dart';

class BookingModel {
  String? bookingId;
  UserModel? renter;
  CarModel? car;
  DateTime? startDate;
  DateTime? endDate;
  Int32? totalHours;
  Int32? totalAmount;
  Bool? driverRequired;
  File? agreement;
  File? receipt;

  BookingModel({
    this.bookingId,
    this.renter,
    this.car,
    this.startDate,
    this.endDate,
    this.totalHours,
    this.totalAmount,
    this.driverRequired,
    this.agreement,
    this.receipt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json['bookingId'],
      renter:
          json['renter'] != null ? UserModel.fromJson(json['renter']) : null,
      car: json['car'] != null ? CarModel.fromJson(json['car']) : null,
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      totalHours: json['totalHours'],
      totalAmount: json['totalAmount'],
      driverRequired: json['driverRequired'],
      agreement: json['agreement'] != null ? File(json['agreement']) : null,
      receipt: json['receipt'] != null ? File(json['receipt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'renter': renter?.toJson(),
      'car': car?.toJson(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'totalHours': totalHours,
      'totalAmount': totalAmount,
      'driverRequired': driverRequired,
      'agreement': agreement?.path,
      'receipt': receipt?.path,
    };
  }
}
