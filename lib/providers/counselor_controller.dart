import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/counselor.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_value.dart';
import 'package:http/http.dart' as http;

class CounselorController extends ChangeNotifier {
  List<Counselor> _list;
  int _numberPage = 0;

  int get getNumberPage {
    int result = _numberPage;
    return result;
  }

  List<Counselor> get list => _list;

  Future<Map<String, List<Counselor>>> getListCounselor(
    String email,
    String fullName,
    String phone,
    int page,
    int limit,
  ) async {
    try {
      Map<String, List<Counselor>> map;
      List<Counselor> list = [];
      String token = await AppValue.getToken();
      log('TOKEN IN LOCAL : $token');

      Uri uri = Uri.parse(
        'https://40.81.193.10/api/counselor/getCounselors?Email=$email&FullName=$fullName&Phone=$phone&Page=$page&Limit=$limit',
      );
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await http.get(
        uri,
        headers: headers,
      );

      log('status code get counselor : ${response.statusCode}');
      final data = await jsonDecode(response.body);
      if (response.statusCode == 404) {
        map = {'${data['message']}': []};
        return map;
      }
      list = (data['counselors'] as List).map((newData) {
        Counselor counselor = Counselor(
          ID: newData['id'] ?? '',
          email: newData['email'] ?? '',
          fullName: newData['fullName'] ?? '',
          phone: newData['phone'] ?? '',
          image: newData['avatar'] ??
              'https://static.remove.bg/remove-bg-web/99ab439c6e8e26adfd8c59cee4eb26f0376a9584/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg',
          description: newData['description'] ?? '',
          address: 'Lê Văn Toản, TPHCM',
          birthday: '03-07-1985',
          gender: 'Nam',
        );
        return counselor;
      }).toList();
      map = {'${data['numPage']}': list};
      _numberPage = data['numPage'];
      _list = list;
      notifyListeners();
      return map;
    } catch (error) {
      log('SOMETHING WRONG! ${error.toString()}');
      // throw (error);
      return null;
    }
  }

  // Update user
  Future<User> updateUser(User user) async {
    String token = await AppValue.getToken();
    Uri uri = Uri.parse('https://20.89.111.129/api/user/updateProfile');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    // log('TOKEN DUOI LOCAL : $token');
    // try {
    final response = await http.put(
      uri,
      // headers: {"Content-Type": "application/json"},
      headers: headers,
      body: jsonEncode({
        "fullName": "${user.fullName}",
        "phone": "${user.phone}",
        "avt": "${user.image}"
      }),
    );
    log('STATUS CODE : ${response.statusCode}');
    // _user = user;
    // log(user.address);
    // log(user.fullName);
    // log(user.email);
    notifyListeners();
    return user;
    // } catch (error) {
    //   log('SONE THING WRONG !');
    //   throw (error);
    // }
  }
}
