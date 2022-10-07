import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Oranos", style: getBoldStyle(fontSize: FontSize.s40)),
          TextSpan(
              text: ".",
              style: getBoldStyle(
                  fontSize: FontSize.s40, color: ColorManager.mainColor)),
        ],
      ),
    );
  }
}
