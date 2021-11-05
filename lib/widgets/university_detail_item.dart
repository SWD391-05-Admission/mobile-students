import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';

class UniversityDetailItem extends StatelessWidget {
  static const routeName = '/university-detail-item';
  University university;

  UniversityDetailItem(this.university);

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    // offset: Offset(1, 1),
                    blurRadius: 8,
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(university.description),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/university-detail-screen',
                  arguments: university);
            },
          ),
        ),
        SizedBox(
          height: _sizeHeight * 0.03,
        ),
      ],
    );
  }
}
