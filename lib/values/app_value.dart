import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AppValue {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static const List<String> listKhuVuc = [
    'Quận 1',
    'Quận 2',
    'Quận 3',
    'Quận 4',
    'Quận 5',
    'Quận 6',
    'Quận 7',
    'Quận 8',
    'Quận 9',
    'Quận 10',
    'Quận 11',
    'Quận 12',
    'Quận Bình Thạnh',
    'Quận Tân Bình',
    'Quận Bình Tân',
    'Quận Gò Vấp',
  ];
  static const List<String> listLoaiTruong = [
    'Công lập',
    'Dân lập',
    'Quân sự',
  ];
  static const List<String> listCapBacDaoTao = [
    'Trung cấp',
    'Cao đẳng',
    'Đại học',
    'Cao học',
  ];
  static const List<String> listKhoiNghanh = [
    'D1',
    'A1',
    'B1',
    'A',
    'D',
    'B',
    'C',
    'E',
  ];
}
