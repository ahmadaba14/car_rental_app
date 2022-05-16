import 'dart:convert';

import 'package:car_rental_app/model/booking_model.dart';
import 'package:http/http.dart';

class BookingApiService {
  final String apiUrl = "https://rentacar107113.herokuapp.com/bookings";

  Future<List<BookingModel>> getBookings() async {
    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<BookingModel> bookings = body.map((dynamic item) {
        return BookingModel.fromJson(item);
      }).toList();
      return bookings;
    } else {
      throw "Can't get bookings";
    }
  }

  Future<BookingModel> getBooking(int id) async {
    Response response = await get(Uri.parse("$apiUrl/$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return BookingModel.fromJson(body);
    } else {
      throw "Can't get booking";
    }
  }

  Future<BookingModel> createBooking(BookingModel booking) async {
    Response response = await post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(booking.toJson()));
    if (response.statusCode == 201) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return BookingModel.fromJson(body);
    } else {
      throw "Can't create booking";
    }
  }

  Future<BookingModel> updateBooking(BookingModel booking) async {
    Response response = await put(Uri.parse("$apiUrl/${booking.bookingId}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(booking.toJson()));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return BookingModel.fromJson(body);
    } else {
      throw "Can't update booking";
    }
  }

  Future<void> deleteBooking(int id) async {
    Response response = await delete(Uri.parse("$apiUrl/$id"));
    if (response.statusCode == 204) {
      return;
    } else {
      throw "Can't delete booking";
    }
  }
}
