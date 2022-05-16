import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

class UserModel {
  String? uid;
  String? email;
  String? password;
  String? name;
  String? phoneNumber;
  String? nationality;
  String? dob;
  File? profilePicture;
  File? idCard;
  File? passport;
  String? rating;
  Array? reviews;

  UserModel(
      {this.uid,
      this.email,
      this.password,
      this.name,
      this.phoneNumber,
      this.nationality,
      this.dob,
      this.profilePicture,
      this.idCard,
      this.passport,
      this.rating,
      this.reviews});

  //Receiving Data from Server
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationality: json['nationality'] as String,
      dob: json['dob'] as String,
      profilePicture: json['profilePicture'] as File,
      idCard: json['idCard'] as File,
      passport: json['passport'] as File,
      rating: json['rating'] as String,
      reviews: json['reviews'] as Array,
    );
  }

  //Sending Data to Server
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
      'nationality': nationality,
      'dob': dob,
      'profilePicture': profilePicture,
      'idCard': idCard,
      'passport': passport,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
