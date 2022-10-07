import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/feature/get_start_1/widgets/get_start_1_chat.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/models/robot_asks_question.dart';
import 'package:chat_ui/models/robot_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mit_x/mit_x.dart';

class GetStart1View extends StatefulWidget {
  const GetStart1View({Key? key}) : super(key: key);

  @override
  State<GetStart1View> createState() => _GetStart1ViewState();
}

class _GetStart1ViewState extends State<GetStart1View> {
  int nexQuestion = 0;

  final TextEditingController sendMessage = TextEditingController();
  final List<RobotMessageModel> robotMessageModel = [
    RobotMessageModel(message: "Hi, Whats Your First Name?".tr, fromMe: false),
  ];

  final List<RobotAsksQuestionCategory> robotAsksQuestionCategory = [
    RobotAsksQuestionCategory(question: "Security".tr),
    RobotAsksQuestionCategory(question: "Supply Chain".tr),
    RobotAsksQuestionCategory(question: "Information Technology".tr),
    RobotAsksQuestionCategory(question: "Human Resource".tr),
    RobotAsksQuestionCategory(question: "Business Research".tr),
  ];

  late String firstName;
  late String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
        child: Stack(
          children: [
            SizedBox(
              height: .95.sh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetStart1Chat(robotMessageModel: robotMessageModel),
                    const SizedBox(height: 10),
                    nexQuestion == 3
                        ? Padding(
                            padding: EdgeInsets.only(left: 50.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...robotAsksQuestionCategory.map((e) {
                                  return Row(
                                    children: [
                                      Checkbox(
                                        splashRadius: 20,
                                        shape: const CircleBorder(),
                                        value: e.active,
                                        onChanged: (val) {
                                          e.active = val!;
                                          setState(() {});
                                        },
                                        activeColor: e.active
                                            ? ColorManager.mainColor
                                            : ColorManager.borderColor,
                                        checkColor: Colors.white,
                                      ),
                                      Text(
                                        e.question,
                                        style: getRegularStyle(
                                            fontSize: FontSize.s14,
                                            color: Colors.black),
                                      ),
                                    ],
                                  );
                                }).toList(),
                                const SizedBox(height: 10),
                                Text(
                                  "Say Done Or Press Send to Apply".tr,
                                  style: getRegularStyle(
                                      fontSize: FontSize.s14,
                                      color: HexColor("#999999")),
                                ),
                                const SizedBox(height: 80),
                              ],
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    SizedBox(
                      width: .8.sw,
                      child: TextField(
                        controller: sendMessage,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManager.borderColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManager.borderColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#F64E60")),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: HexColor("#F6F7F8"),
                            filled: true,
                            contentPadding: const EdgeInsets.all(12),
                            hintText: "Type something…".tr,
                            prefixIcon: const Icon(Icons.language),
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                child: SvgGenImage(
                                        const $AssetsImagesGen().voice.path)
                                    .svg(fit: BoxFit.scaleDown),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        MitX.unFocusField();
                        robotMessageModel.add(RobotMessageModel(
                            message: sendMessage.text, fromMe: true));
                        if (nexQuestion == 0) {
                          firstName = sendMessage.text;
                          robotMessageModel.add(RobotMessageModel(
                              message:
                                  "${"Ok".tr}${",".tr} $firstName ${"Whats Your Last Name?".tr}",
                              fromMe: false));
                        } else if (nexQuestion == 1) {
                          lastName = sendMessage.text;
                          robotMessageModel.add(RobotMessageModel(
                              message:
                                  "${"Mr".tr} $firstName $lastName ${",".tr} ${"What's your Title?".tr}",
                              fromMe: false));
                        } else if (nexQuestion == 2) {
                          robotMessageModel.add(RobotMessageModel(
                              message:
                                  "What Categories you will need expert In?".tr,
                              fromMe: false));
                        } else if (nexQuestion == 3) {
                          MitX.offAllNamed(Routes.homeRoute);
                        }

                        sendMessage.text = "";
                        nexQuestion++;

                        setState(() {});
                      },
                      child: SvgGenImage(const $AssetsImagesGen().send.path)
                          .svg(fit: BoxFit.scaleDown),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
