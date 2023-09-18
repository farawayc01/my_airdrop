// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/shared_widget/my_alert.dart';
import 'package:my_airdrop/shared_widget/my_btn.dart';
import 'package:my_airdrop/shared_widget/textfield.dart';
import 'package:my_airdrop/shared_widget/textstyle.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordRegisterVisible = true;
  bool _isConfirmPasswordVisible = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  Future signUp() async {
    if (_email.text.isNotEmpty &&
        _name.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _confirmPassword.text.isNotEmpty) {
      if (passwordConfirmed()) {
        // create user
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(),
            password: _password.text.trim(),
          );

          // add user details
          addUserDetails(
            _name.text.trim(),
            _email.text.trim(),
          );

          setState(() {
            _name.clear();
            _email.clear();
            _password.clear();
            _confirmPassword.clear();
          });

          FirebaseAuth.instance.signOut();
          Navigator.pop(context);
          MyAlert.successAlert(
              context, "Your account has been created successfully.");
        } on FirebaseAuthException catch (e) {
          MyAlert.alertError(context, e.message.toString());
        }
      } else {
        MyAlert.alertError(context,
            "Ensure that the password and confirm password are the same.");
      }
    } else {
      MyAlert.alertError(context, "Ensure the data is entered correctly.");
    }
  }

  Future addUserDetails(String username, String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'username': username,
      'email': email,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAirdrop.yellow,
      appBar: AppBar(
        backgroundColor: MyAirdrop.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
                  'assets/images/Registerremake.png',
                  width: 250.w,
                  height: 250.w,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Register",
                    style: CustomTextStyle.getVtStyle(
                      fontFamily: "Quicksand",
                      fontColor: MyAirdrop.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                    ),
                  ),
                ),
                CustomTextField(
                  fontSize: 20.sp,
                  icon: Icons.person,
                  fontColor: MyAirdrop.black,
                  fontHintColor: MyAirdrop.grey,
                  title: "Name",
                  hintText: "Name",
                  controller: _name,
                  readOnly: false,
                  keyboardType: TextInputType.text,
                  enabledBorderColor: MyAirdrop.purple,
                  focusBorderColor: MyAirdrop.purple,
                ),
                CustomTextField(
                  fontSize: 20.sp,
                  icon: Icons.person,
                  fontColor: MyAirdrop.black,
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
                  fontSize: 20.sp,
                  icon: Icons.person,
                  fontColor: MyAirdrop.black,
                  fontHintColor: MyAirdrop.grey,
                  title: "Password Register",
                  hintText: "Password",
                  controller: _password,
                  readOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  enabledBorderColor: MyAirdrop.purple,
                  focusBorderColor: MyAirdrop.purple,
                  visibilityPassword: _isPasswordRegisterVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordRegisterVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordRegisterVisible =
                            !_isPasswordRegisterVisible;
                      });
                    },
                  ),
                ),
                CustomTextField(
                  fontSize: 20.sp,
                  icon: Icons.person,
                  fontColor: MyAirdrop.black,
                  fontHintColor: MyAirdrop.grey,
                  title: "Confirm Password",
                  hintText: "Confirm Password",
                  controller: _confirmPassword,
                  readOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  enabledBorderColor: MyAirdrop.purple,
                  focusBorderColor: MyAirdrop.purple,
                  visibilityPassword: _isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                IniButton(
                  title: "Sign Up",
                  textColor: MyAirdrop.yellow,
                  textWeight: FontWeight.w500,
                  textSize: 20.sp,
                  backgroundColor: MyAirdrop.purple,
                  borderColor: MyAirdrop.yellow,
                  onTap: signUp,
                ),
                SizedBox(
                  height: 20.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
