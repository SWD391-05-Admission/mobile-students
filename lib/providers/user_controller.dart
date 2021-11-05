import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_value.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  User _user;

  User get user {
    User user = _user;
    return user;
  }

  void setUser() {
    getUser().then((value) {
      _user = User(
        image: value.image,
        fullName: value.fullName,
        email: value.email,
        address: value.address,
        birthday: value.birthday,
        highSchool: value.highSchool,
        phone: value.phone,
      );
      log('USER IMAGE : ${_user.image}');
      notifyListeners();
    }).catchError((error) {
      log('error in setUser() - ${error.toString()}'.toUpperCase());
      // throw error;
    });
  }

  // Future setUser1(data) async {
  //   _user = User(
  //       address: data['student']['address'] ?? '',
  //       birthday: data['student']['dob'] ?? '',
  //       email: data['student']['email'] ?? '',
  //       fullName: data['student']['fullName'] ?? '',
  //       highSchool: data['student']['oldSchool'] ?? '',
  //       image: data['student']['avatar'] ?? '',
  //       phone: data['student']['phone'] ?? '',
  //     );
  //     log('user ${_user.}');
  // }

  void setUpdateUser(User user) {
    updateUser(user).then((value) {
      _user = User(
        image: value.image,
        fullName: value.fullName,
        email: value.email,
        address: value.address,
        birthday: value.birthday,
        highSchool: value.highSchool,
        phone: value.phone,
      );
      notifyListeners();
      log('${_user.fullName}');
    });
  }

  Future<User> getUser() async {
    try {
      String token = await AppValue.getToken();
      Uri uri = Uri.parse('https://40.81.193.10/api/student/getStudent');
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      // log('token get from local : $token');
      final response = await http.get(
        uri,
        headers: headers,
      );
      log('STATUS CODE getUser() IN UserController() : ${response.statusCode}');
      final data = await jsonDecode(response.body);
      String dob = '';
      String day = '', month = '', year = '';
      String dateOB = '';
      if (data['student']['dob'] != null) {
        dob = data['student']['dob'].toString().substring(0, 10);
        day = dob.substring(8, 10);
        month = dob.substring(5, 7);
        year = dob.substring(0, 4);
        dateOB = '$month-$day-$year';
      }
      final user = User(
        address: data['student']['address'] ?? '',
        // birthday: '',
        birthday: dateOB ?? '',
        email: data['student']['email'] ?? '',
        fullName: data['student']['fullName'] ?? '',
        highSchool: data['student']['oldSchool'] ?? '',
        image: data['student']['avatar'] ?? '',
        phone: data['student']['phone'] ?? '',
      );
      _user = user;
      notifyListeners();
      return user;
    } catch (error) {
      log('Error in getUser() - ${error.toString()}'.toUpperCase());
      // throw (error);
    }
    return null;
  }

  // Update user
  Future<User> updateUser(User user) async {
    String token = await AppValue.getToken();
    Uri uri = Uri.parse('https://40.81.193.10/api/student/updateStudent');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode({
          "fullName": "${user.fullName}",
          "phone": "${user.phone}",
          "address": "${user.address}",
          "dob": "${user.birthday}",
          // "dob": "$dob",
          "oldSchool": "${user.highSchool}",
          "avatar": "${user.image}"
        }),
      );
      log('STATUS CODE : ${response.statusCode} ${response.body}');
      _user = user;
      notifyListeners();
      return user;
    } catch (error) {
      log('SONE THING WRONG in update usser !');
      // throw (error);
    }
    return null;
  }
}
