import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/models/experts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class RecommendExperts extends StatelessWidget {
  const RecommendExperts({
    Key? key,
    required this.expertModel,
  }) : super(key: key);

  final List<ExpertsModel> expertModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommended Experts".tr,
            style: getMediumStyle(fontSize: FontSize.s16),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              size: 30,
              color: ColorManager.borderColor,
            ),
          )
        ],
      ),
      SizedBox(
        height: 260.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: expertModel.length,
          itemBuilder: (context, index) => SizedBox(
            width: context.width * .44,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorManager.borderColor),
              ),
              child: GestureDetector(
                onTap: () {
                  // MitX.toNamed(Routes.chatRoute);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AssetGenImage(expertModel[index].image).image(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starColor,
                              ),
                              const SizedBox(width: 5),
                              Text("(${expertModel[index].rate})"),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: ColorManager.favoriteDisable,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expertModel[index].name,
                            style: getMediumStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            expertModel[index].desc,
                            style: getRegularStyle(
                              fontSize: FontSize.s12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14)
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
        ),
      )
    ]);
  }
}
