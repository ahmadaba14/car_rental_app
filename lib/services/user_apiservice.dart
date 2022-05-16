import 'dart:convert';

import 'package:car_rental_app/model/user_model.dart';
import 'package:http/http.dart';

class UserApiService {
  final String apiUrl = "https://rentacar107113.herokuapp.com/users";

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<UserModel> users =
          body.map((dynamic item) => UserModel.fromJson(item)).toList();
      return users;
    } else {
      throw "Can't get users";
    }
  }

  Future<UserModel> getUser(String id) async {
    Response response = await get(Uri.parse("$apiUrl/$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(body);
      return user;
    } else {
      throw "Can't get user";
    }
  }

  Future<UserModel> registerUser(UserModel user) async {
    Response response = await post(Uri.parse("$apiUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 201) {
      Map<String, dynamic> body = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(body);
      return user;
    } else {
      throw "Can't create user";
    }
  }

  Future<UserModel> loginUser(UserModel user) async {
    Response response = await post(Uri.parse("$apiUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(body);
      return user;
    } else {
      throw "Can't login user";
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    Response response = await put(Uri.parse("$apiUrl/${user.uid}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(body);
      return user;
    } else {
      throw "Can't update user";
    }
  }
}
