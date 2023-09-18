import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/shared_widget/textstyle.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Add View",
          style: CustomTextStyle.getVtStyle(
            fontColor: MyAirdrop.black,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
