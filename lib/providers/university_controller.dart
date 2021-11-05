import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/address.dart';
import 'package:mobile_customer/models/admission.dart';
import 'package:mobile_customer/models/admissions.dart';
import 'package:mobile_customer/models/distric.dart';
import 'package:mobile_customer/models/major.dart';
import 'package:mobile_customer/models/majors.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_value.dart';
import 'package:http/http.dart' as http;

class UniversityConntroller extends ChangeNotifier {
  List<University> _list;
  int _numberPage = 0;

  int get getNumberPage {
    int result = _numberPage;
    return result;
  }

  List<University> get list => _list;

  Future<Map<String, List<University>>> getListUniversity(
    String email,
    String fullName,
    String phone,
    int page,
    int limit,
  ) async {
    try {
      Map<String, List<University>> map;
      List<University> list = [];
      String token = await AppValue.getToken();
      log('TOKEN IN LOCAL : $token');

      Uri uri = Uri.parse(
        'http://40.81.193.10/api/university/chuaxongxaiduoc/getUniversities?Page=$page&Limit=$limit',
      );
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      final response = await http.get(
        uri,
        headers: headers,
      );
      log('status code get university : ${response.statusCode}');
      final data = await jsonDecode(response.body);
      // log(data.toString());
      // log('NUMBER PAGE : ${data['numPage']}');
      // log('DATA ${data['admins']}');
      list = (data['admins'] as List).map((newData) {
        List<Address> listAddress = [];
        listAddress = (newData['addresses'] as List).map((dataAddress) {
          District district;
          district = District(
            ID: dataAddress['district']['id'],
            name: dataAddress['district']['name'],
          );
          Address address = Address(
            ID: dataAddress['id'],
            address: dataAddress['address'],
            district: district,
          );
          // log('ADDRESS NEF ${address.address}');
          return address;
        }).toList();
        List<Admissions> listAdmissions = [];
        listAdmissions = (newData['admissions'] as List).map((dataAdmissions) {
          Admission admission = Admission(
              dataAdmissions['admission']['id'],
              dataAdmissions['admission']['method'],
              dataAdmissions['admission']['description']);
          Admissions admissions = Admissions(dataAdmissions['id'], admission);
          return admissions;
        }).toList();
        List<Majors> listMajors = [];
        listMajors = (newData['majors'] as List).map((dataMajor) {
          Major major = Major(
              id: dataMajor['major']['id'],
              name: dataMajor['major']['name'],
              description: dataMajor['major']['description']);
          Majors majors = Majors(dataMajor['id'], major);
          return majors;
        }).toList();
        University university = University(
          ID: newData['id'],
          code: newData['code'] ?? '',
          description: newData['description'] ?? '',
          email: newData['email'] ?? '',
          facebook: newData['facebook'] ?? '',
          image: newData['images'][0]['src'] ?? '',
          lastYearBenchMark: newData['lastYearBenchmark'] ?? '',
          listAddress: listAddress,
          maxFee: newData['maxFee'] ?? '',
          minFee: newData['minFee'] ?? '',
          name: newData['name'] ?? '',
          website: newData['website'] ?? '',
          listAdmission: listAdmissions,
          listMajor: listMajors,
        );
        return university;
      }).toList();
      // log('NUMBER PAGE : ${data['numPage']}');
      // for (University i in list) {
      //   log('TEN : ${i.name}');
      // }

      map = {'${data['numPage']}': list};
      // log('MAP ${map.entries.first.key}');
      // log('MAP ${map.entries.first.value.toString()}');
      _numberPage = data['numPage'];
      _list = list;
      // log(_list.length.toString());

      notifyListeners();
      return map;
    } catch (error) {
      log('SOMETHING WRONG in get lisst university! ${error.toString()}');
      // throw (error);
      return null;
    }
  }
}
