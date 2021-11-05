import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/university.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class UniversityDetailScreen extends StatelessWidget {
  const UniversityDetailScreen();
  static const routeName = '/university-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    University university = ModalRoute.of(context).settings.arguments;
    List<Widget> getList() {
      List<Widget> list = [];
      for (int i = 0; i < university.listAddress.length; i++) {
        list.add(
          Text(
            '>>  ${university.listAddress[i].address}, ${university.listAddress[i].district.name}', //need feed
            style: AppStyle.bookDetail.copyWith(fontSize: 14),
          ),
        );
      }
      return list;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin trường đại học',
          style: AppStyle.barStyleMontserrat,
        ),
        // flexibleSpace:
        //     Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // child: Image.network(university.image),
              child: CachedNetworkImage(
                imageUrl: university.image,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black45,
                      value: 5,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: _sizeHeight * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Mã trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.code}',
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
                      text: 'Tên trường : ',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.name}',
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
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.website}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 13,
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
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${university.email}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 13,
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
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: '${university.facebook}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3366FF),
                            fontSize: 13,
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
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${university.lastYearBenchMark.toStringAsFixed(0)}',
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
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${university.minFee.toStringAsFixed(0)} - ${university.maxFee.toStringAsFixed(0)} đồng/năm',
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
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(height: 1, color: Colors.black26),
                  SizedBox(height: 10),
                  Text(
                    'Địa chỉ : ',
                    style: AppStyle.bookDetail.copyWith(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...getList(),
                  SizedBox(height: 10),
                  Divider(height: 1, color: Colors.black26),
                  SizedBox(height: 10),
                  Text(
                    'Phương thức tuyển sinh : ',
                    style: AppStyle.bookDetail.copyWith(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  for (int i = 0; i < university.listAdmission.length; i++) ...{
                    Text(
                      '>> ${university.listAdmission[i].admission.method} (${university.listAdmission[i].admission.description})',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 3),
                  },
                  SizedBox(height: 10),
                  Divider(height: 1, color: Colors.black26),
                  SizedBox(height: 10),
                  Text(
                    'Danh sách chuyên nghành : ',
                    style: AppStyle.bookDetail.copyWith(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  for (int i = 0; i < university.listMajor.length; i++) ...{
                    Text(
                      '>> ${university.listMajor[i].major.name} (Mã : ${university.listMajor[i].major.id})',
                      style: AppStyle.bookDetail.copyWith(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 3),
                  }
                ],
              ),
            ),
            SizedBox(height: _sizeHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
