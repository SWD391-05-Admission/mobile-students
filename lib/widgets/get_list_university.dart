import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class GetListUniversity {
  List<Widget> getListUniversity(
      List<University> list, double sizeHeight, BuildContext context) {
    List<Widget> listWidget = [];
    // listWidget.add(SearchWidget(nameSearch: 'university'));
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    listWidget.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 170),
        child: Divider(
          color: Colors.black38,
        ),
      ),
    );
    listWidget.add(SizedBox(height: sizeHeight * 0.015));
    for (int i = 0; i < list.length; i++) {
      listWidget.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0xFFBBBBBB),
                      )
                    ],
                    border: Border.all(width: 0.05, color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(4.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        // child: Image.network(list[i].image),
                        child: CachedNetworkImage(
                          imageUrl: list[i].image,
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          children: [
                            Text(
                              'Mã trường : ',
                              style: AppStyle.bookDetail.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${list[i].code}',
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 13,
                                shadows: [
                                  Shadow(
                                    // offset: Offset(1.0, 1.0),
                                    blurRadius: 8,
                                    color: Color(0xFF999999),
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          children: [
                            Text(
                              'Tên trường : ',
                              style: AppStyle.bookDetail.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${list[i].name}',
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 13,
                                shadows: [
                                  Shadow(
                                    // offset: Offset(1.0, 1.0),
                                    blurRadius: 8,
                                    color: Color(0xFF999999),
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          children: [
                            Text(
                              'Email : ',
                              style: AppStyle.bookDetail.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${list[i].email}',
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 13,
                                shadows: [
                                  Shadow(
                                    // offset: Offset(1.0, 1.0),
                                    blurRadius: 8,
                                    color: Color(0xFF999999),
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          children: [
                            Text(
                              'Facebook : ',
                              style: AppStyle.bookDetail.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${list[i].facebook}',
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 13,
                                shadows: [
                                  Shadow(
                                    // offset: Offset(1.0, 1.0),
                                    blurRadius: 8,
                                    color: Color(0xFF999999),
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          children: [
                            Text(
                              'Học phí : ',
                              style: AppStyle.bookDetail.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${list[i].minFee.toStringAsFixed(0)} - ${list[i].maxFee.toStringAsFixed(0)} đồng/năm',
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 13,
                                shadows: [
                                  Shadow(
                                    // offset: Offset(1.0, 1.0),
                                    blurRadius: 8,
                                    color: Color(0xFF999999),
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  Text(
                                    'Website : ',
                                    style: AppStyle.bookDetail.copyWith(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${list[i].website} ',
                                    style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      fontSize: 13,
                                      shadows: [
                                        Shadow(
                                          // offset: Offset(1.0, 1.0),
                                          blurRadius: 8,
                                          color: Color(0xFF999999),
                                        ),
                                      ],
                                      fontWeight: FontWeight.bold,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            // Expanded(child: SizedBox()),
                            GestureDetector(
                              child: Text(
                                'Chi tiết >>',
                                style: AppStyle.bookDetail,
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/university-detail-screen',
                                    arguments: list[i]);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/university-detail-screen',
                      arguments: list[i]);
                },
              ),
              SizedBox(height: sizeHeight * 0.02),
            ],
          ),
        ),
      );
      (i < list.length - 1)
          ? listWidget.add(SizedBox(
              height: 8,
            ))
          : listWidget.add(SizedBox());
    }
    return listWidget;
  }
}
