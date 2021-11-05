import 'dart:developer';
import 'package:flutter/material.dart';
import '../providers/google_sign_in.dart';
import '../values/app_styles.dart';
import 'package:provider/provider.dart';

class AuthenScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _AuthenScreenState createState() => _AuthenScreenState();
}

class _AuthenScreenState extends State<AuthenScreen> {
  String _messErrorUserName = '',
      _messErrorPassword = '',
      _messErrorConfirmPass = '',
      _messErrorPhone = '';
  String userName = '', password = '', phone = '', confirmPass = '';
  bool _loginScreen = true;
  bool _hidePass = true;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;

  Widget getTextField({
    String lableText,
    Icon icon,
    double height,
    String helperText,
    Widget suffixIcon,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: height,
        child: TextField(
          controller: controller,
          obscureText:
              (lableText == 'Password' || lableText == 'Confirm password')
                  ? _hidePass
                  : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            helperText: helperText,
            helperStyle: AppStyle.helperText,
            labelText: lableText,
            labelStyle: AppStyle.labelText,
            prefixIcon: icon,
            prefixText: ' ',
            fillColor: Colors.black,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusColor: Colors.black38,
          ),
          cursorColor: Colors.black12,
          style: AppStyle.h1,
          keyboardType: (lableText == 'Phone')
              ? TextInputType.number
              : TextInputType.text,
          onChanged: (value) {
            if (lableText == 'Username')
              userName = value;
            else if (lableText == 'Password')
              password = value;
            else if (lableText == 'Phone')
              phone = value;
            else if (lableText == 'Confirm password') confirmPass = value;
          },
        ),
      ),
    );
  }

  Widget getScreenSignIn() {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CHOOSE', style: AppStyle.logoChooseUniver),
              Text('UNIVERSITY', style: AppStyle.logoChooseUniver),
              SizedBox(height: _sizeHeight * 0.035),
              Container(
                height: (_sizeHeight * 0.54),
                width: _sizeWidth * 0.84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: _sizeHeight * 0.03),
                    Text(('SIGN IN'), style: AppStyle.titleSignInUp),
                    SizedBox(height: _sizeHeight * 0.025),
                    getTextField(
                        lableText: 'Username',
                        icon: Icon(Icons.person_rounded, color: Colors.black45),
                        height: _sizeHeight * 1 / 11,
                        helperText: _messErrorUserName,
                        controller: userNameController),
                    SizedBox(height: _sizeHeight * 0.01),
                    getTextField(
                      lableText: 'Password',
                      icon: Icon(Icons.lock, color: Colors.black45),
                      height: _sizeHeight * 1 / 11,
                      helperText: _messErrorPassword,
                      suffixIcon: IconButton(
                        icon: _hidePass
                            ? Icon(Icons.visibility_off, color: Colors.black45)
                            : Icon(Icons.visibility, color: Colors.black45),
                        onPressed: () {
                          setState(() => _hidePass = !_hidePass);
                        },
                      ),
                      controller: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Forgot password',
                              style: AppStyle.link,
                            ),
                            onTap: () => print('TAP ON FORGOT PASSWORD'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _sizeHeight * 0.015,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              child: Text(
                                'SIGN IN',
                                style: AppStyle.button,
                              ),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _sizeHeight * 0.003),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                'Sign in with Google',
                                textAlign: TextAlign.center,
                                style: AppStyle.loginGmail,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false,
                          );
                          log('VO LOGIN');
                          provider.googleLogin();
                        },
                      ),
                    ),
                    SizedBox(height: _sizeHeight * 0.013),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ? ',
                          style: AppStyle.h4CourierNew,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign up now',
                            style: AppStyle.link,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            setState(() {
                              _hidePass = true;
                              userNameController.clear();
                              passwordController.clear();
                              _loginScreen = false;
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: _sizeHeight * 0.013),
                  ],
                ),
              ),
              SizedBox(height: _sizeHeight * 0.013),
            ],
          ),
        ],
      ),
    );
  }

  Widget getScreenSignUp() {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CHOOSE', style: AppStyle.logoChooseUniver),
          Text('UNIVERSITY', style: AppStyle.logoChooseUniver),
          SizedBox(height: _sizeHeight * 0.035),
          Container(
            height: _sizeHeight * 0.625,
            width: _sizeWidth * 0.84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Colors.black38,
                  offset: Offset(2, 2),
                )
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: _sizeHeight * 0.03),
                Text(('SIGN UP'), style: AppStyle.titleSignInUp),
                SizedBox(height: _sizeHeight * 0.025),
                getTextField(
                  lableText: 'Username',
                  height: _sizeHeight * 1 / 11,
                  icon: Icon(
                    Icons.person_rounded,
                    color: Colors.black45,
                  ),
                  helperText: _messErrorUserName,
                  controller: userNameController,
                ),
                SizedBox(height: _sizeHeight * 0.01),
                getTextField(
                  controller: phoneController,
                  height: _sizeHeight * 1 / 11,
                  helperText: _messErrorPhone,
                  icon: Icon(
                    Icons.local_phone,
                    color: Colors.black45,
                  ),
                  lableText: 'Phone',
                ),
                SizedBox(height: _sizeHeight * 0.01),
                getTextField(
                  lableText: 'Password',
                  controller: passwordController,
                  helperText: _messErrorPassword,
                  height: _sizeHeight * 1 / 11,
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black45,
                  ),
                  suffixIcon: IconButton(
                    icon: _hidePass
                        ? Icon(Icons.visibility_off, color: Colors.black45)
                        : Icon(Icons.visibility, color: Colors.black45),
                    onPressed: () {
                      setState(() => _hidePass = !_hidePass);
                    },
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.01),
                getTextField(
                  controller: confirmPassController,
                  height: _sizeHeight * 1 / 11,
                  helperText: _messErrorConfirmPass,
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black45,
                  ),
                  lableText: 'Confirm password',
                  suffixIcon: IconButton(
                    icon: _hidePass
                        ? Icon(Icons.visibility_off, color: Colors.black45)
                        : Icon(Icons.visibility, color: Colors.black45),
                    onPressed: () {
                      setState(() => _hidePass = !_hidePass);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Text(
                            'SIGN UP',
                            style: AppStyle.button,
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizeHeight * 0.011),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to sign in  ',
                      style: AppStyle.h4CourierNew,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign in now',
                        style: AppStyle.link,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        setState(() {
                          _hidePass = true;
                          userNameController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          confirmPassController.clear();
                          _loginScreen = true;
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                    ),
                  ],
                ),
                // SizedBox(height: _sizeHeight * 0.005),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: (isLoading == true)
            ? Center(child: CircularProgressIndicator(color: Colors.black54))
            : Center(
                child: _loginScreen ? getScreenSignIn() : getScreenSignUp()),
      ),
    );
  }
}
