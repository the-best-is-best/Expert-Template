import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/l10n/language_manager.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/feature/components/my_elevated_button.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 247.w,
                    height: 134.h,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "hi,MyNameIs".tr),
                          TextSpan(
                              text: "robotName".tr,
                              style: getBoldStyle(fontSize: FontSize.s19)),
                          TextSpan(text: "robotDialogGetStart".tr),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              SvgGenImage(const $AssetsImagesGen().robot.path).svg(),
              const SizedBox(height: 25),
              MyElevatedButton(
                  width: 147.w,
                  title: "next".tr,
                  onPressed: () {
                    MitX.offAndToNamed(Routes.getStart1Route);
                  })
            ],
          ),
          Positioned(
            right: 50,
            top: 160.h,
            child: SvgGenImage(const $AssetsImagesGen().robotAlert.path)
                .svg(height: 200.h),
          ),
          Positioned(
              bottom: 26,
              right: 0,
              left: 13,
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            LanguageManager.changeLanguage();
                          },
                          child: Text(
                            LanguageManager.lang == "en"
                                ? "العربيه"
                                : "English",
                            style: getRegularStyle(fontSize: FontSize.s15)
                                .copyWith(
                                    fontFamily: FontFamily.facebookSansRegular),
                          ),
                        )
                      ]),
                ),
              )),
        ],
      ),
    );
  }
}
