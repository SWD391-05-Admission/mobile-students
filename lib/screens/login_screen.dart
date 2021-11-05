import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/providers/auth.dart';
import 'package:mobile_customer/providers/google_sign_in.dart';
import 'package:mobile_customer/providers/user_controller.dart';
import 'package:provider/provider.dart';
import '../screens/authen_screen.dart';
import '../widgets/bottom_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();
  static const routeName = '/login-auth';

  Future _getAuthen(BuildContext context) async {
    await Authen().authen().then((value) {
      log('Mess $value');
      if (value == '500') {
        log('return 500');
        final provider = Provider.of<GoogleSignInProvider>(
          context,
          listen: false,
        );
        provider.googleLogout();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Server đang bảo trì !",
            textAlign: TextAlign.center,
          ),
        ));
        // return AuthenScreen();
      } else if (value == '200') {
        log('return 200');
        // UserController().getUser();
      } else {
        final provider = Provider.of<GoogleSignInProvider>(
          context,
          listen: false,
        );
        provider.googleLogout();
        log('return 400');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // content: Text("$value", textAlign: TextAlign.center),
            content: Text(
              "Email của bạn đã đăng kí bên ứng dụng của người tư vấn !",
              textAlign: TextAlign.center,
            ),
          ),
        );
        // return AuthenScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log('connection state wating'.toUpperCase());
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          log('snapshot has data'.toUpperCase());
          // _getAuthen(context);
          return BottomBar();
        } else if (snapshot.hasError) {
          log('snapshot has error'.toUpperCase());
          return Center(child: Text('Something wrong !'));
        } else {
          log('snapshot else'.toUpperCase());
          return AuthenScreen();
        }
      },
    );
  }
}
