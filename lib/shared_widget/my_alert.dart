import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';

class MyAlert {
  static void alertError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.error, color: MyAirdrop.white),
            SizedBox(width: 10.w),
            SizedBox(
              width: 280.w,
              child: Text(
                text,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    color: MyAirdrop.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void successAlert(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Icon(Icons.error, color: MyAirdrop.white),
            SizedBox(width: 10.w),
            SizedBox(
              width: 280.w,
              child: Text(
                text,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    color: MyAirdrop.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
