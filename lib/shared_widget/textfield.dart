import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_airdrop/constant/color.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Color fontHintColor;
  final Color fontColor;
  final Color enabledBorderColor;
  final Color focusBorderColor;
  final bool readOnly;
  final bool? visibilityPassword;
  final bool? visibilityConfirmPassword;
  final double fontSize;
  final IconButton? suffixIcon;
  final TextInputType keyboardType;
  final Function()? onTap;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.readOnly,
    required this.keyboardType,
    required this.fontHintColor,
    required this.fontColor,
    required this.fontSize,
    required this.enabledBorderColor,
    required this.focusBorderColor,
    this.visibilityPassword,
    this.visibilityConfirmPassword,
    this.onTap,
    this.suffixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visibilityPassword = true;
  bool visibilityPasswordRegister = true;
  bool visibilityConfirmPassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      if (widget.title == "Password") {
        visibilityPassword = !visibilityPassword;
      } else if (widget.title == "Password Register") {
        visibilityPasswordRegister = !visibilityPasswordRegister;
      } else if (widget.title == "Confirm Password") {
        visibilityConfirmPassword = !visibilityConfirmPassword;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: MyAirdrop.white,
                  child: TextFormField(
                    onTap: widget.onTap,
                    obscureText: widget.title == "Password"
                        ? visibilityPassword
                        : widget.title == "Password Register"
                            ? visibilityPasswordRegister
                            : widget.title == "Confirm Password"
                                ? visibilityConfirmPassword
                                : false,
                    keyboardType: widget.keyboardType,
                    readOnly: widget.readOnly,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon != null
                          ? widget.title == "Password"
                              ? IconButton(
                                  icon: Icon(
                                    visibilityPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                )
                              : widget.title == "Password Register"
                                  ? IconButton(
                                      icon: Icon(
                                        visibilityPasswordRegister
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    )
                                  : widget.title == "Confirm Password"
                                      ? IconButton(
                                          icon: Icon(
                                            visibilityConfirmPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: _togglePasswordVisibility,
                                        )
                                      : null
                          : null,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.focusBorderColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.enabledBorderColor, width: 2),
                      ),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                          color: widget.fontHintColor,
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w500),
                    ),
                    style: TextStyle(
                        color: widget.fontColor,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
