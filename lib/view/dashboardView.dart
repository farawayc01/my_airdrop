import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/shared_widget/textstyle.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAirdrop.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyAirdrop.white,
        title: Text(
          "Dashboard",
          style: CustomTextStyle.getVtStyle(
            fontColor: MyAirdrop.black,
            fontWeight: FontWeight.w800,
            fontSize: 24.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: GestureDetector(
              onTap: null,
              child: Icon(
                Icons.search_rounded,
                color: MyAirdrop.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dashboard View",
              style: CustomTextStyle.getVtStyle(
                fontColor: MyAirdrop.black,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
