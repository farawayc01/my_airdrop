import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/shared_widget/my_alert.dart';
import 'package:my_airdrop/shared_widget/textstyle.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() async {
    try {
      await _auth.signOut();
      // Sign-out berhasil, Anda dapat melakukan tindakan selanjutnya seperti kembali ke layar masuk atau halaman awal.
    } catch (e) {
      // ignore: use_build_context_synchronously
      MyAlert.alertError(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile View",
              style: CustomTextStyle.getVtStyle(
                fontColor: MyAirdrop.black,
                fontSize: 18.sp,
              ),
            ),
            TextButton(
              onPressed: signOut,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: MyAirdrop.yellow,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    "Logout",
                    style: TextStyle(color: MyAirdrop.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
