import 'package:flutter/material.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/widgets/university_item.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen();
  static const routeName = '/university-item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST UNIVERSITY'),
        flexibleSpace: AppColors.flexibleSpace,
        centerTitle: true,
      ),
      body: UniversityItem(),
    );
  }
}
