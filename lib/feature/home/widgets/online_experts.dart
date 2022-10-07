import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class OnlineExperts extends StatelessWidget {
  const OnlineExperts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Online Experts".tr,
              style: getMediumStyle(fontSize: FontSize.s16),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: ColorManager.borderColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Stack(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.circleBackgroundOnlineColor,
                      radius: 30.r,
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "Lance",
                      style: getMediumStyle(
                        fontSize: FontSize.s9,
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: CircleAvatar(
                    radius: 5.r,
                    backgroundColor: ColorManager.circleOnlineColor,
                  ),
                )
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
          ),
        )
      ],
    );
  }
}
