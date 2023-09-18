import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/authentication/checking_user.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/firebase_options.dart';
import 'package:my_airdrop/shared_widget/my_btn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyAirdrop',
          theme: ThemeData(
            primarySwatch: Colors.red,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: MyAirdrop.black, // Ubah ke warna yang diinginkan
            ),
            fontFamily: 'Quicksand',
            useMaterial3: true,
          ),
          //memeriksa IP
          home: const FirstPage(),
        );
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyAirdrop.yellow,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/getstarted.png',
                width: 350.w,
                height: 350.w,
              ),
              Image.asset(
                'assets/images/shadow.png',
                width: 280.w,
                height: 30.w,
              ),
            ],
          ),
          Positioned(
            bottom: 20.h, // Sesuaikan dengan posisi yang Anda inginkan
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: SizedBox(
                height: 45.h,
                child: IniButton(
                  title: "Get Started",
                  textColor: MyAirdrop.yellow,
                  textWeight: FontWeight.w500,
                  textSize: 20.sp,
                  backgroundColor: MyAirdrop.purple,
                  borderColor: MyAirdrop.yellow,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckingUser(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
