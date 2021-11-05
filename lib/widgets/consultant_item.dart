import 'package:flutter/material.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/widgets/consultant_detail_item.dart';

class ConsultantItem extends StatelessWidget {
  const ConsultantItem();
  static const routeName = '/consultant-item';
  @override
  Widget build(BuildContext context) {
    List<User> listConsultant = [];
    listConsultant = User.createListConsulant();
    return ListView.builder(
      itemCount: listConsultant.length,
      itemBuilder: (context, index) {
        return ConsultantDetailItem(listConsultant[index]);
      },
    );
  }
}
