import 'package:flutter/material.dart';
import 'package:mobile_customer/models/user.dart';

class ConsultantDetailItem extends StatelessWidget {
  static const routeName = '/consultant-detail-item';
  User user;
  ConsultantDetailItem(this.user);

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
                    child: Image.network(user.image),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/consultant-detail-screen', arguments: user);
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
