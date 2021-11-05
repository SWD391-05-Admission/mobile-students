import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen();
  static const routeName = '/book-detail-screen';

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isShow = false;
  Column listUniverWidget(Talkshow talkshow) {
    List<Widget> listUniverWidget = [];
    listUniverWidget.add(SizedBox(
      height: 3,
    ));
    return Column(
      children: [...listUniverWidget],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    Talkshow talkshow = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Talkshow',
          style: AppStyle.titleSearch,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(talkshow.image),
            ),
            SizedBox(
              height: _sizeHeight * 0.017,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${talkshow.description}',
                    style: AppStyle.bookDetail,
                  ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'Date time : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'at ${talkshow.timeStart} - ${talkshow.timeFinish}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
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
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'Major : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.major.name}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
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
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),
                  RichText(
                    text: TextSpan(
                      text: 'Price : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.price}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
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
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),

                  RichText(
                    text: TextSpan(
                      text: 'Counselor : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '${talkshow.counselor.fullName}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
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
                        ),
                        TextSpan(
                          text:
                              ' (See information about ${talkshow.counselor.fullName})',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(
                                '/counselor-detail-screen',
                                arguments: talkshow.counselor,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),

                  Row(
                    children: [
                      Text(
                        'List of universities suitable for this major',
                        style: AppStyle.bookDetail,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_drop_down,
                          // size: 25,
                        ),
                        onTap: () {
                          log('ontap');
                          setState(() {
                            // isShow = !isShow;
                            if (isShow) {
                              isShow = false;
                            } else {
                              isShow = true;
                            }
                            log(isShow.toString());
                          });
                        },
                      ),
                    ],
                  ),
                  // SizedBox(height: 0.5),
                  (isShow) ? listUniverWidget(talkshow) : SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
