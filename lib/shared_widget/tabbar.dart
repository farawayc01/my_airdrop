import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';
import 'package:my_airdrop/view/addView.dart';
import 'package:my_airdrop/view/chatView.dart';
import 'package:my_airdrop/view/dashboardView.dart';
import 'package:my_airdrop/view/notesView.dart';
import 'package:my_airdrop/view/profile.dart';

// ignore: must_be_immutable
class TabbarMain extends StatefulWidget {
  int? indexTap;
  TabbarMain({super.key, this.indexTap});

  @override
  State<TabbarMain> createState() => _TabbarMainState();
}

class _TabbarMainState extends State<TabbarMain> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.indexTap ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60.h,
        color: MyAirdrop.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _onItemTapped(0);
              },
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 20.sp,
                      color: _selectedIndex == 0
                          ? MyAirdrop.black
                          : MyAirdrop.white,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(1);
              },
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sticky_note_2_sharp,
                      size: 20.sp,
                      color: _selectedIndex == 1
                          ? MyAirdrop.black
                          : MyAirdrop.white,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(2);
              },
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 20.sp,
                      color: _selectedIndex == 2
                          ? MyAirdrop.black
                          : MyAirdrop.white,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(3);
              },
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      size: 20.sp,
                      color: _selectedIndex == 3
                          ? MyAirdrop.black
                          : MyAirdrop.white,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(4);
              },
              child: SizedBox(
                width: 70.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 20.sp,
                      color: _selectedIndex == 4
                          ? MyAirdrop.black
                          : MyAirdrop.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const NotesView();
      case 2:
        return const AddView();
      case 3:
        return const ChatView();
      case 4:
        return const ProfileView();
      default:
        return const DashboardView();
    }
  }
}
