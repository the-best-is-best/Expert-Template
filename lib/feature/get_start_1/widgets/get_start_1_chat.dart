import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/models/robot_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStart1Chat extends StatelessWidget {
  const GetStart1Chat({
    Key? key,
    required this.robotMessageModel,
  }) : super(key: key);

  final List<RobotMessageModel> robotMessageModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: robotMessageModel.length,
      itemBuilder: (context, index) => Row(
          mainAxisAlignment: robotMessageModel[index].fromMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            robotMessageModel[index].fromMe
                ? const SizedBox()
                : CircleAvatar(
                    backgroundColor: ColorManager.borderColor,
                    child:
                        SvgGenImage(const $AssetsImagesGen().robotMessage.path)
                            .svg()),
            const SizedBox(
              width: 14,
            ),
            Container(
              height: 48.h,
              width: 260.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ColorManager.borderColor),
                  color: robotMessageModel[index].fromMe
                      ? ColorManager.mainColor
                      : ColorManager.messageColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      robotMessageModel[index].message,
                      style: getRegularStyle(
                          fontSize: FontSize.s14,
                          color: robotMessageModel[index].fromMe
                              ? Colors.white
                              : null),
                    ),
                  ),
                ],
              ),
            ),
            robotMessageModel[index].fromMe
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:
                        SvgGenImage(const $AssetsImagesGen().readMessage.path)
                            .svg(),
                  )
                : const SizedBox(),
          ]),
      separatorBuilder: (context, index) => const SizedBox(height: 45),
    );
  }
}
