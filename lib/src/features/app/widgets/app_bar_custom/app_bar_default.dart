import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? customOnBack;
  final List<Widget>? actions;

  AppBarDefault(
      {Key? key,
      required this.title,
      this.actions = const [],
      this.customOnBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                if (customOnBack != null)
                  customOnBack!();
                else
                  Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 26.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title.replaceAll('', '\u200B'),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 27.w),
            Visibility(
                visible: actions != null && actions!.length > 0,
                child: Row(
                  children: actions!,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(300, 70);
}
