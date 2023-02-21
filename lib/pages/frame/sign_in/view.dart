import 'package:chatty/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "Coms.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 34.sp,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(String loginType, String logo) {
    return GestureDetector(
      onTap: () {
        controller.handleSignIn("google");
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(bottom: 15.h),
        width: 295.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:logo==""?MainAxisAlignment.center:MainAxisAlignment.start,
            children: [
          logo == ''
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 40.w, right: 30.w),
                  child: Image.asset("assets/icons/${logo}.png"),
                ),
          Container(
            child: Text(
              "Sign in with $loginType",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildOrWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text(" or  "),
          Expanded(
            child: Divider(
              endIndent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpWidget() {
    return GestureDetector(
      onTap: () {
        print("...sign In...");
      },
      child: Column(
        children: [
          Text("Already have an account?",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          GestureDetector(
              onTap: () {},
              child:Text("Sign-In here",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryElement,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
          child: Column(
        children: [
          _buildLogo(),
          _buildThirdPartyLogin("Google", "google"),
          _buildThirdPartyLogin("Facebook", "facebook"),
          _buildThirdPartyLogin("Apple ID", "apple"),
          _buildOrWidget(),
          _buildThirdPartyLogin("Phone Number", ""),
          SizedBox(height: 40.h),
          _buildSignUpWidget()
        ],
      )),
    );
  }
}
