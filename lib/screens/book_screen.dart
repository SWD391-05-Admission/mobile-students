import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/providers/talkshow_controller.dart';
import 'package:mobile_customer/values/app_styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen();
  static const routesName = '/setting';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

bool check = false;

class _SettingScreenState extends State<SettingScreen> {
  List<Talkshow> listTalkshow = [];
  Future future;
  Future future2;
  @override
  void initState() {
    future = TalkshowController().getListTalkshowPending();
    future2 = TalkshowController().getListTalkshowHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeHeight * 0.07),
          child: Column(
            children: [
              SizedBox(
                height: 38,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sắp diễn ra",
                        style: AppStyle.barStyle,
                        // style: AppStyle.titleSearch,
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lịch sử tham gia",
                        style: AppStyle.barStyle,
                        // style: AppStyle.titleSearch,
                      ),
                    ),
                  ),
                ],
                unselectedLabelColor: Colors.black26,
                indicatorColor: Colors.black,
                indicatorWeight: 0.9,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Talkshow>> mapTalkshow = snapshot.data;
                  String numberOfPage = mapTalkshow.keys.elementAt(0);
                  List<Talkshow> list = mapTalkshow.entries.first.value;
                  if (list.length == 0) {
                    return Center(
                      child: Text(
                        'Bạn chưa đăng kí buổi tư vấn nào!',
                        style: AppStyle.barStyle,
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 2, left: 15, right: 15),
                      child: Column(
                        children: [
                          for (int i = 0; i < list.length; i++) ...{
                            GestureDetector(
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 140,
                                    // child: Image.network(
                                    //   list[i].image,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child: CachedNetworkImage(
                                      imageUrl: list[i].image,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[i].description,
                                            style: AppStyle.bookDetail
                                                .copyWith(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Vào lúc ${list[i].timeStart} ngày ${list[i].date}',
                                            style: AppStyle.bookDetail
                                                .copyWith(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Nhà diễn giả : ${list[i].counselor.fullName}',
                                            style: AppStyle.bookDetail
                                                .copyWith(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Giá : ${list[i].price} miếng dưa hấu',
                                            style: AppStyle.bookDetail
                                                .copyWith(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Chi tiết >>',
                                            style: AppStyle.bookDetail.copyWith(
                                              fontSize: 13,
                                              // color: Color(0xFF3366FF),
                                              // fontStyle: FontStyle.italic,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 15,
                                  // ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete_outline,
                                      size: 28,
                                      color: Colors.black87,
                                    ),
                                    onTap: () {
                                      return showDialog(
                                        context: context,
                                        builder: (context) {
                                          // String areaDropdow;
                                          return SimpleDialog(
                                            // key: _formKey,
                                            children: <Widget>[
                                              Text(
                                                'Bạn có muốn hủy tham gia buổi tư vấn này không ?',
                                                style: AppStyle.titleSearch,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                  height: _sizeHeight * 0.02),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      TalkshowController()
                                                          .cancleTalkshow(
                                                              list[i].ID)
                                                          .then((value) {
                                                        if (value) {
                                                          setState(() {
                                                            future =
                                                                TalkshowController()
                                                                    .getListTalkshowPending();
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                              "Đã hủy !",
                                                              style: AppStyle
                                                                  .bookDetail
                                                                  .copyWith(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ));
                                                          Navigator.pop(
                                                              context, false);
                                                        } else {
                                                          log('xóa fail');
                                                        }
                                                      });
                                                    },
                                                    child: Text(
                                                      'Có',
                                                      style:
                                                          AppStyle.titleSearch,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: _sizeWidth * 0.03,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Không',
                                                      style:
                                                          AppStyle.titleSearch,
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
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/talkshow-detail-history-screen',
                                  arguments: list[i],
                                );
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            (i < list.length - 1)
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 15,
                                    ),
                                    child: Divider(
                                        height: 1, color: Colors.black26),
                                  )
                                : SizedBox(),
                          },
                        ],
                      ),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black38,
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ),
            FutureBuilder(
              future: future2,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Talkshow>> mapTalkshow = snapshot.data;
                  String numberOfPage = mapTalkshow.keys.elementAt(0);
                  List<Talkshow> list = mapTalkshow.entries.first.value;
                  if (list.length == 0) {
                    return Center(
                      child: Text(
                        'Bạn chưa tham gia bất kì buổi tư vấn nào!',
                        style: AppStyle.barStyle,
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Column(
                        children: [
                          for (int i = 0; i < list.length; i++) ...{
                            GestureDetector(
                              child: Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 100,
                                    child: Image.network(
                                      list[i].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[i].description,
                                            style: AppStyle.bookDetail,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Vào lúc ${list[i].timeStart} ngày ${list[i].date}',
                                            style: AppStyle.bookDetail,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Nhà diễn giả : ${list[i].counselor.fullName}',
                                            style: AppStyle.bookDetail,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Giá : ${list[i].price} miếng dưa hấu',
                                            style: AppStyle.bookDetail,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/talkshow-detail-history-screen',
                                    arguments: list[i]);
                              },
                            ),
                            (i < list.length - 1)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Divider(
                                        height: 1, color: Colors.black26),
                                  )
                                : SizedBox(),
                          }
                        ],
                      ),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black38,
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
