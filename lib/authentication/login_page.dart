// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_airdrop/authentication/register_page.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/shared_widget/my_alert.dart';
import 'package:my_airdrop/shared_widget/my_btn.dart';
import 'package:my_airdrop/shared_widget/textfield.dart';
import 'package:my_airdrop/shared_widget/textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signIn() async {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          MyAlert.alertError(
              context, "The email you entered is not registered");
        } else if (e.code == 'wrong-password') {
          MyAlert.alertError(context, "The password you entered is incorrect");
        } else if (e.code == 'invalid-email') {
          MyAlert.alertError(context, "The email you entered is not valid");
        } else {
          MyAlert.alertError(context, e.code);
        }
      }
    } else {
      MyAlert.alertError(context, "Email or Password cannot be empty!");
    }
  }

  Future logininwithgoogle() async {
    bool result = false;
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential myCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(myCredential);
      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          // tambahkan data ke firestore
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'email': user.email,
            'role': 'user',
            'createdAt': DateTime.now().toIso8601String(),
          });
        }
        result = true;
      }
      return result;
    } on FirebaseAuthException catch (e) {
      MyAlert.alertError(context, e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAirdrop.yellow,
      appBar: AppBar(
        backgroundColor: MyAirdrop.transparent,
        leading: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.undo_outlined,
            color: MyAirdrop.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/loginremake.png', // Ganti dengan path file gambar Anda
                  width: 250.w,
                  height: 250.w,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: MyAirdrop.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                    ),
                  ),
                ),
                CustomTextField(
                  icon: Icons.person,
                  fontSize: 20.sp,
                  fontColor: MyAirdrop.purple,
                  fontHintColor: MyAirdrop.grey,
                  title: "Email",
                  hintText: "Email",
                  controller: _email,
                  readOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  enabledBorderColor: MyAirdrop.purple,
                  focusBorderColor: MyAirdrop.purple,
                ),
                CustomTextField(
                  icon: Icons.person,
                  fontSize: 20.sp,
                  fontColor: MyAirdrop.purple,
                  fontHintColor: MyAirdrop.grey,
                  title: "Password",
                  hintText: "Password",
                  controller: _password,
                  readOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  enabledBorderColor: MyAirdrop.purple,
                  focusBorderColor: MyAirdrop.purple,
                  visibilityPassword: _isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                IniButton(
                  title: "Login",
                  textColor: MyAirdrop.yellow,
                  textWeight: FontWeight.w500,
                  textSize: 20.sp,
                  backgroundColor: MyAirdrop.purple,
                  borderColor: MyAirdrop.yellow,
                  onTap: signIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun ?",
                      style: CustomTextStyle.getVtStyle(
                        fontFamily: "Quicksand",
                        fontSize: 16.sp,
                        fontColor: MyAirdrop.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: CustomTextStyle.getVtStyle(
                          fontFamily: "Quicksand",
                          fontSize: 16.sp,
                          fontColor: MyAirdrop.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: MyAirdrop.purple,
                        height: 2.w,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "or",
                        style: CustomTextStyle.getVtStyle(
                          fontFamily: "Quicksand",
                          fontSize: 16.sp,
                          fontColor: MyAirdrop.purple,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: MyAirdrop.black,
                        height: 2.w,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: MyAirdrop.grey.withOpacity(0.6)),
                  width: 60.w,
                  height: 60.w,
                  child: GestureDetector(
                    onTap: logininwithgoogle,
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Image.asset(
                        "assets/images/google.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
