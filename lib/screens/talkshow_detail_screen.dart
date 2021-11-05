import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/providers/talkshow_controller.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/widgets/bottom_bar_widget.dart';

class TalkshowDetailScreen extends StatefulWidget {
  const TalkshowDetailScreen();
  static const routeName = '/talkshow-detail-screen';

  @override
  _TalkshowDetailScreenState createState() => _TalkshowDetailScreenState();
}

String _getDate(String date) {
  String day = date.substring(8, 10);
  String month = date.substring(5, 7);
  String year = date.substring(0, 4);
  return '$day-$month-$year';
}

class _TalkshowDetailScreenState extends State<TalkshowDetailScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    Column listUniverWidget(Talkshow talkshow) {
      List<Widget> listUniverWidget = [];
      listUniverWidget.add(SizedBox(
        height: 3,
      ));
      return Column(
        children: [...listUniverWidget],
      );
    }

    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    Talkshow talkshow = ModalRoute.of(context).settings.arguments;

    String dateStart = _getDate(talkshow.date);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed(BottomBar.routeName);
          },
        ),
        title: Text(
          'Thông tin buổi tư vấn',
          style: AppStyle.barStyleMontserrat,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // child: Image.network(talkshow.image),
              child: CachedNetworkImage(
                imageUrl: talkshow.image,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black45,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: _sizeHeight * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  Text(
                    '${talkshow.description}',
                    style: AppStyle.bookDetail.copyWith(fontSize: 16),
                  ),
                  // Text(
                  //   'Time : ${talkshow.timeStart} - ${talkshow.timeFinish}',
                  //   style: AppStyle.desciptionStyle,
                  // ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Thời gian bắt đầu : ',
                      style: AppStyle.bookDetail
                          .copyWith(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.timeStart} ngày $dateStart',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Chuyên nghành : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.major.name}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Giá : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.price} miếng dưa hấu',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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

                  // RichText(
                  //   text: TextSpan(
                  //     text: 'List of university : ',
                  //     style: AppStyle.bookDetail.copyWith(
                  //       color: Colors.black,
                  //     ),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: '${talkshow.price}',
                  //         style: TextStyle(
                  //           fontFamily: AppFonts.poppins,
                  //           fontSize: 12,
                  //           shadows: [
                  //             Shadow(
                  //               // offset: Offset(1.0, 1.0),
                  //               blurRadius: 8,
                  //               color: Color(0xFF999999),
                  //             ),
                  //           ],
                  //           fontWeight: FontWeight.bold,
                  //           // fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //       // TextSpan(text: ' world!'),
                  //     ],
                  //   ),
                  // ),

                  // Text(
                  //   'Time finish: ${talkshow.timeFinish}',
                  //   style: AppStyle.desciptionStyle,
                  // ),
                  SizedBox(height: 6),

                  RichText(
                    text: TextSpan(
                      text: 'Nhà diễn giả : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${talkshow.counselor.fullName}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
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
                              ' (Thông tin chi tiết về ${talkshow.counselor.fullName})',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
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
                  SizedBox(height: 10),
                  Divider(height: 1, color: Colors.black26),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Tên trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.name}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),

                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Mã trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.code}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Website : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.website}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Email : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${talkshow.university.email}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Facebook : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${talkshow.university.facebook}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Điểm đầu vào năm trước : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${talkshow.university.lastYearBenchMark.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Học phí : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${talkshow.university.minFee.toStringAsFixed(0)} - ${talkshow.university.maxFee.toStringAsFixed(0)} đồng/năm',
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // offset: Offset(1.0, 1.0),
                                blurRadius: 8,
                                color: Color(0xFF999999),
                              ),
                            ],
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: _sizeHeight * 0.14),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 110.0,
        height: 36.0,
        // width: 90.0,
        // height: 40.0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          child: Text(
            '\$${talkshow.price} ĐẶT NGAY',
            style: AppStyle.bookDetail.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                // String areaDropdow;
                return SimpleDialog(
                  // key: _formKey,
                  children: <Widget>[
                    Text(
                      'Bạn có muốn đăng kí không ?',
                      style: AppStyle.titleSearch,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: _sizeHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            TalkshowController().bookTalkshow(talkshow.ID).then(
                              (value) {
                                if (value == '200') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Đặt thành công !",
                                      style: AppStyle.bookDetail.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                                  Navigator.of(context).pop();
                                } else if (value == '500') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Server có gì đó sai !",
                                      style: AppStyle.bookDetail.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                                  Navigator.of(context).pop();
                                } else if (value == 'Booked this talkshow') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Bạn đã đặt buổi tư vấn này rồi !",
                                      style: AppStyle.bookDetail.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                                  Navigator.of(context).pop();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Có gì đó sai sai !",
                                      style: AppStyle.bookDetail.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                                  Navigator.of(context).pop();
                                }
                              },
                            );
                          },
                          child: Text(
                            'Có',
                            style: AppStyle.titleSearch,
                          ),
                        ),
                        SizedBox(
                          width: _sizeWidth * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Không',
                            style: AppStyle.titleSearch,
                          ),
                        ),
                        SizedBox(
                          width: _sizeWidth * 0.06,
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
