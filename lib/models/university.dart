import 'package:mobile_customer/models/address.dart';
import 'package:mobile_customer/models/admissions.dart';
import 'package:mobile_customer/models/majors.dart';

class University {
  int ID;
  String code;
  String name;
  String email;
  String facebook;
  String website;
  String description;
  double lastYearBenchMark;
  double minFee;
  double maxFee;
  List<Address> listAddress;
  String image;
  List<Admissions> listAdmission;
  List<Majors> listMajor;

  University({
    this.ID,
    this.code,
    this.name,
    this.email,
    this.facebook,
    this.website,
    this.description,
    this.lastYearBenchMark,
    this.minFee,
    this.maxFee,
    this.listAddress,
    this.image,
    this.listAdmission,
    this.listMajor,
  });
}
