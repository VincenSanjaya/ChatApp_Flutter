import 'package:chatty/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "MessagePage",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
