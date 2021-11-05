import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/providers/google_sign_in.dart';
import 'package:mobile_customer/providers/user_controller.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();
  static const routeName = '/profile';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget createContainer(title, value, user) {
    return SizedBox(
      height: 50, // NEED FEED HEIGHT
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 9, left: 9, top: 10), // NEED FEED HEIGHT
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      title,
                      style: AppStyle.h3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    value,
                    style: AppStyle.h3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 7),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                    onTap: () {
                      _displayDialog(context, title, value, user);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Divider(
              color: Colors.grey.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }

  _displayLogout() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 5,
          title: Text(
            'Bạn có muốn đăng xuất không ?',
            style: AppStyle.h1.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFFDDDDDD)),
              child: Text(
                'Không',
                style: AppStyle.h2.copyWith(fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFFDDDDDD)),
              child: Text(
                'Có',
                style: AppStyle.h2.copyWith(fontSize: 15),
              ),
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(
                  context,
                  listen: false,
                );
                provider.googleLogout();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            SizedBox(
              width: 1,
            ),
          ],
        );
      },
    );
  }

  List<Widget> listRow(User user) {
    List<Widget> list = [
      createContainer(
          "Họ và Tên", (user.fullName == null) ? '' : user.fullName, user),
      createContainer("Email", (user.email == null) ? '' : user.email, user),
      createContainer(
          "Địa chỉ", (user.address == null) ? '' : user.address, user),
      createContainer(
          "Ngày sinh", (user.birthday == null) ? '' : user.birthday, user),
      createContainer(
          "Số điện thoại", (user.phone == null) ? '' : user.phone, user),
      createContainer("Trường cấp 3",
          (user.highSchool == null) ? '' : user.highSchool, user),
      SizedBox(
        height: 50, // NEED FEED HEIGHT
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 9, left: 9, top: 10), // NEED FEED HEIGHT
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      'Đăng xuất',
                      style: AppStyle.h3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 7),
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                      onTap: () {
                        _displayLogout();
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Divider(
                color: Colors.grey.withOpacity(0.15),
              ),
            ),
          ],
        ),
      ),
    ];
    return list;
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(
      BuildContext context, String titleField, String value, User user) async {
    String newTitle = titleField.toLowerCase();
    var controller = TextEditingController();
    controller.text = value;
    String oldValue = '';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 5,
          title: Text(
            'Nhập $newTitle mới của bạn',
            style: AppStyle.h1.copyWith(fontSize: 19),
          ),
          content: TextField(
            controller: controller,
            autofocus: true,
            // cursorHeight: 0.5,
            // autocorrect: true,
            // textDirection: ,

            textInputAction: TextInputAction.go,
            // keyboardType: TextInputType.multiline(),
            decoration: InputDecoration(
              // hintText: " Enter your $titleField",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              // focusedBorder: UnderlineInputBorder
              // contentPadding: EdgeInsets.only(bottom: -10),
            ),
            cursorColor: Colors.black54,
            // cursorHeight: 4,
            // showCursor: false,
            maxLines: 2,

            style: AppStyle.h2,
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFFDDDDDD)),
              child: Text(
                'Hủy bỏ',
                style: AppStyle.h2,
              ),
              onPressed: () {
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFFDDDDDD)),
              child: Text(
                'Lưu',
                style: AppStyle.h2,
              ),
              onPressed: () async {
                if (titleField == 'Email') {
                  user.email = controller.text;
                } else if (titleField == 'Địa chỉ') {
                  user.address = controller.text;
                } else if (titleField == 'Họ và Tên') {
                  user.fullName = controller.text;
                } else if (titleField == 'Ngày sinh') {
                  user.birthday = controller.text;
                } else if (titleField == 'Số điện thoại') {
                  user.phone = controller.text;
                } else if (titleField == 'Trường cấp 3') {
                  user.highSchool = controller.text;
                }

                await UserController().updateUser(user);
                _getUser = UserController().getUser();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _getUser;
  @override
  void initState() {
    _getUser = UserController().getUser();
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    //-------------------------
    return DefaultTabController(
      length: 2,
      child: FutureBuilder<User>(
        // future: UserController().getUser(),
        future: _getUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black38,
              ),
            );
          } else if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(_sizeHeight * 0.246),
                child: SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF999999).withOpacity(0.4),
                              // spreadRadius: 0.1,
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            // child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    fit: StackFit.expand,
                                    children: [
                                      AdvancedAvatar(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              spreadRadius: 0.1,
                                              blurRadius: 10,
                                              offset: Offset(2,
                                                  3), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        size: 90,
                                        // image: AssetImage(
                                        //     'assets/images/avatar.png'),
                                        image:
                                            NetworkImage(snapshot.data.image),
                                        foregroundDecoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            // color: Color(0xFF49F0EE),
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 67,
                                        bottom: 1,
                                        right: -28,
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            // log('TAP CHANGE AVATAR');
                                          },
                                          elevation: 8.0,
                                          fillColor: Color(0xFFF5F6F9),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.black,
                                            size: 14,
                                          ),
                                          shape: CircleBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    snapshot.data.fullName,
                                    // 'Le Duy Tuan Vu',
                                    style: AppStyle.h1.copyWith(
                                      color: Colors.black87,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.poppins,
                                      fontSize: 19,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 8,
                                          color: Color(0xFF555555),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: _sizeHeight * 0.005,
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Hồ sơ", style: AppStyle.barStyle),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Ví tiền", style: AppStyle.barStyle),
                            ),
                          ),
                        ],
                        unselectedLabelColor: Colors.black38,
                        indicatorColor: Colors.black,
                        indicatorWeight: 0.8,
                      )
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ...listRow(snapshot.data),
                    ],
                  ),
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Text(
                        'Tổng tiền trong ví : 100 miếng dưa hấu',
                        style: AppStyle.h1.copyWith(fontSize: 16),
                      ),
                    ],
                  )),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: FloatingActionButton(
                onPressed: () {
                  log('Something wrong 1 !');
                  final provider = Provider.of<GoogleSignInProvider>(
                    context,
                    listen: false,
                  );
                  // bool logout = true;
                  // provider.googleLogout().then((_) => logout = false);
                  provider.googleLogout();
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.logout),
              ),
            );
          } else {
            return Center(
              child: FloatingActionButton(
                onPressed: () {
                  log('Something wrong 2 !');

                  final provider = Provider.of<GoogleSignInProvider>(
                    context,
                    listen: false,
                  );
                  // bool logout = true;
                  // provider.googleLogout().then((_) => logout = false);
                  provider.googleLogout();
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.logout),
              ),
            );
          }
        },
      ),
    );
  }
}
