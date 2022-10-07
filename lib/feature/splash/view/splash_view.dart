import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/l10n/language_manager.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/feature/components/my_elevated_button.dart';
import 'package:chat_ui/feature/components/logo_w_title.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(const $AssetsImagesGen().splash.path),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Stack(
              children: [
                SizedBox(
                  width: context.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Logo(),
                      const SizedBox(height: 5),
                      Text(
                        "splashTitle".tr,
                        style: getSemiBoldStyle(fontSize: FontSize.s19),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 74,
                  right: 0,
                  left: 13,
                  child: MyElevatedButton(
                    fullWidth: true,
                    title: "getStarted".tr,
                    onPressed: () {
                      MitX.offAllNamed(Routes.getStartRoute);
                    },
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 13,
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "donotHaveAnAccount?".tr,
                              style: getRegularStyle(fontSize: FontSize.s18)),
                          TextSpan(
                              text: "signUp".tr,
                              style: getRegularStyle(
                                  fontSize: FontSize.s19,
                                  color: ColorManager.mainColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
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
                                          fontFamily:
                                              FontFamily.facebookSansRegular),
                                ),
                              )
                            ]),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
