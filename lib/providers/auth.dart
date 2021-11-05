import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as UserFB;
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Authen {
  Future<String> authen() async {
    final user = UserFB.FirebaseAuth.instance.currentUser;
    String firebaseToken;
    await user.getIdTokenResult().then((value) {
      firebaseToken = value.token;
    });
    log('TOKEN FIREBASE 1 : $firebaseToken');
    String app = 'Student';
    Uri url = Uri.parse('https://40.81.193.10/api/login');
    try {
      http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'firebaseToken': '$firebaseToken', 'app': '$app'}),
      );
      log('STATUS CODE OF authen() IN Authen() : ${response.statusCode}');
      final data = await jsonDecode(response.body);
      // log('TOKEN NE : $data');

      if (response.statusCode < 400) {
        log('200');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', '${data['token']}');
        return '200';
      } else if (response.statusCode < 500) {
        log('< 500');
        return (data['message']);
        // return data['message'];
        // new GoogleSignInProvider().googleLogout();
      } else {
        log('500');
        return '500';
      }
    } catch (error) {
      // throw error;
      log('ERROR in authen = ${error.toString()}');
      // return error.toString();
      return '';
    }
  }
}
