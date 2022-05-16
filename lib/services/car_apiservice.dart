import 'dart:convert';

import 'package:car_rental_app/model/car_model.dart';
import 'package:http/http.dart';

class CarApiService {
  final String apiUrl = "https://rentacar107113.herokuapp.com/cars";

  Future<List<CarModel>> getCars() async {
    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<CarModel> cars = (json.decode(response.body) as List)
          .map((data) => new CarModel.fromJson(data))
          .toList();
      return cars;
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<CarModel> getCar(int id) async {
    Response response = await get(Uri.parse("$apiUrl/$id"));
    if (response.statusCode == 200) {
      CarModel car = new CarModel.fromJson(json.decode(response.body));
      return car;
    } else {
      throw Exception('Failed to load car');
    }
  }

  Future<CarModel> createCar(CarModel car) async {
    Response response = await post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(car.toJson()));
    if (response.statusCode == 201) {
      CarModel newCar = new CarModel.fromJson(json.decode(response.body));
      return newCar;
    } else {
      throw Exception('Failed to create car');
    }
  }

  Future<CarModel> updateCar(CarModel car) async {
    Response response = await put(Uri.parse("$apiUrl/${car.carId}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(car.toJson()));
    if (response.statusCode == 200) {
      CarModel updatedCar = new CarModel.fromJson(json.decode(response.body));
      return updatedCar;
    } else {
      throw Exception('Failed to update car');
    }
  }

  Future<bool> deleteCar(int id) async {
    Response response = await delete(Uri.parse("$apiUrl/$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete car');
    }
  }
}
