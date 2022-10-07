import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/feature/components/logo_w_title.dart';
import 'package:chat_ui/feature/home/widgets/online_experts.dart';
import 'package:chat_ui/feature/home/widgets/recommend_experts.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:chat_ui/models/experts_model.dart';
import 'package:chat_ui/models/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<ExpertsModel> expertModel = [
    ExpertsModel(
      id: 1,
      image: const $AssetsImagesGen().expert1.path,
      rate: 5.0,
      name: "Kareem Adel".tr,
      desc: "Supply Chain".tr,
    ),
    ExpertsModel(
      id: 2,
      image: const $AssetsImagesGen().expert2.path,
      rate: 4.9,
      name: "Merna Adel".tr,
      desc: "Supply Chain".tr,
    ),
  ];

  final List<HomeData> homeData = [
    HomeData(
        icon: const $AssetsImagesGen().it.path,
        title: "Information Technology".tr,
        expert: 23),
    HomeData(
        icon: const $AssetsImagesGen().supplyChain.path,
        title: "Supply Chain".tr,
        expert: 12),
    HomeData(
        icon: const $AssetsImagesGen().security.path,
        title: "Security".tr,
        expert: 14),
    HomeData(
        icon: const $AssetsImagesGen().hr.path,
        title: "Human Resource".tr,
        expert: 8),
    HomeData(
        icon: const $AssetsImagesGen().immigration.path,
        title: "Immigration".tr,
        expert: 8),
    HomeData(
        icon: const $AssetsImagesGen().translation.path,
        title: "Translation".tr,
        expert: 3),
  ];
  bool openMenu = false;

  @override
  Widget build(BuildContext context) {
    final double heightScreen =
        MediaQuery.of(context).size.height - // total height
            kToolbarHeight - // top AppBar height
            MediaQuery.of(context).padding.top - // top padding
            kBottomNavigationBarHeight
        // BottomNavigationBar height
        ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading:
            AssetGenImage(const $AssetsImagesGen().profileImage.path).image(),
        title: const Logo(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              child: SvgGenImage(const $AssetsImagesGen().search.path)
                  .svg(width: 20),
            ),
          ),
        ],
        shape: Border(
          bottom: BorderSide(color: ColorManager.borderColor, width: .5),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SizedBox(
              height: heightScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  RecommendExperts(expertModel: expertModel),
                  const OnlineExperts(),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: openMenu ? 200.h : heightScreen - 10,
              width: context.width * .92,
              child: Container(
                decoration: openMenu
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ColorManager.borderColor),
                      )
                    : null,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      width: context.width,
                      height: 10,
                      child: InkWell(
                        hoverColor: ColorManager.transparent,
                        onTap: () {
                          setState(() {
                            openMenu = !openMenu;
                          });
                        },
                        child: Center(
                          child: SvgGenImage(
                                  const $AssetsImagesGen().rectangle.path)
                              .svg(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width,
                      height: 480.h,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ListView.separated(
                          clipBehavior: Clip.hardEdge,
                          shrinkWrap: true,
                          itemCount: homeData.length,
                          itemBuilder: (context, index) => SizedBox(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ColorManager.mainColor, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading:
                                    SvgGenImage(homeData[index].icon).svg(),
                                title: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homeData[index].title,
                                        style: getMediumStyle(
                                            fontSize: FontSize.s14),
                                      ),
                                      Text(
                                        "${homeData[index].expert} ${"Experts".tr}",
                                        style: getRegularStyle(
                                            fontSize: FontSize.s12),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        currentIndex: 0,
        onTap: (int index) {},
        items: [
          BottomNavigationBarItem(
              icon: SvgGenImage(const $AssetsImagesGen().home.path)
                  .svg(color: ColorManager.mainColor),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgGenImage(const $AssetsImagesGen().star.path).svg(),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgGenImage(const $AssetsImagesGen().wallet.path).svg(),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgGenImage(const $AssetsImagesGen().profile.path).svg(),
              label: ""),
        ],
      ),
    );
  }
}
