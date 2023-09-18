import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_airdrop/authentication/login_page.dart';
import 'package:my_airdrop/shared_widget/tabbar.dart';

class CheckingUser extends StatelessWidget {
  const CheckingUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if (snapshot.hasData && snapshot.data!.emailVerified == true)
          if (snapshot.data != null) {
            return TabbarMain();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
