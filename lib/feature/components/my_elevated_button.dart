import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.fullWidth = false,
  }) : super(key: key);
  final String title;
  final double? width;
  final bool fullWidth;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? context.width : width,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: getMediumStyle(fontSize: FontSize.s18, color: Colors.white),
        ),
      ),
    );
  }
}
