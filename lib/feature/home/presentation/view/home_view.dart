import 'package:chat_ui/app/resources/app_strings.dart';
import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:chat_ui/app/resources/font_manger.dart';
import 'package:chat_ui/app/resources/styles_manger.dart';
import 'package:chat_ui/feature/components/logo_w_title.dart';
import 'package:chat_ui/feature/home/cubit/home_cubit.dart';
import 'package:chat_ui/feature/home/cubit/home_states.dart';
import 'package:chat_ui/feature/home/domain/models/category_model.dart';
import 'package:chat_ui/feature/home/presentation/widgets/online_experts.dart';
import 'package:chat_ui/feature/home/presentation/widgets/recommend_experts.dart';
import 'package:chat_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      HomeCubit homeCubit = HomeCubit.get(context);
      homeCubit.getHomeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

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
      body: BlocBuilder<HomeCubit, HomeStates>(
          buildWhen: (previous, current) =>
              current is GetDataHomeState ||
              current is LoadedHomeState ||
              current is FailureHomeState,
          builder: (context, state) {
            if (state is GetDataHomeState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FailureHomeState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: getBoldStyle(fontSize: FontSize.s16),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          homeCubit.getHomeData();
                        },
                        child: Text(AppStrings.retryAgain.tr))
                  ],
                ),
              );
            } else if (homeCubit.homeModel == null) {
              return const SizedBox();
            } else {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: heightScreen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          RecommendExperts(
                              expertModel:
                                  homeCubit.homeModel!.recommendedExpertsModel),
                          OnlineExperts(
                              onlineExpertModel:
                                  homeCubit.homeModel!.onlineExpertModel),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeStates>(
                      buildWhen: (previous, current) =>
                          current is OpenMenuState,
                      builder: (context, state) {
                        return NotificationListener<
                            DraggableScrollableNotification>(
                          onNotification: (notification) {
                            if (notification.extent > .02 &&
                                !homeCubit.isOpenMenu) {
                              homeCubit.openMenu();
                            } else if (notification.extent <= .02 &&
                                homeCubit.isOpenMenu) {
                              homeCubit.openMenu();
                            }
                            return true;
                          },
                          child: DraggableScrollableSheet(
                            initialChildSize: .02,
                            minChildSize: .02,
                            maxChildSize: .8,
                            builder: (context, scrollController) => ButtonSheet(
                              categoryModel: homeCubit.homeModel!.categoryModel,
                              scrollController: scrollController,
                            ),
                          ),
                        );
                      }),
                ],
              );
            }
          }),
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

class ButtonSheet extends StatefulWidget {
  const ButtonSheet({
    Key? key,
    required this.categoryModel,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  final List<CategoryModel> categoryModel;

  @override
  State<ButtonSheet> createState() => _ButtonSheetState();
}

class _ButtonSheetState extends State<ButtonSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Container(
        color: HomeCubit.get(context).isOpenMenu ? Colors.white : null,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 5),
            SizedBox(
              width: context.width,
              height: 10,
              child: Center(
                child:
                    SvgGenImage(const $AssetsImagesGen().rectangle.path).svg(),
              ),
            ),
            SizedBox(
              width: context.width,
              height: 480.h,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.hardEdge,
                  shrinkWrap: true,
                  itemCount: widget.categoryModel.length,
                  itemBuilder: (context, index) {
                    CategoryModel category = widget.categoryModel[index];
                    return SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: ColorManager.mainColor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: SvgGenImage(category.icon).svg(),
                          title: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.title,
                                  style: getMediumStyle(fontSize: FontSize.s14),
                                ),
                                Text(
                                  "${category.expert} ${"Experts".tr}",
                                  style:
                                      getRegularStyle(fontSize: FontSize.s12),
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
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
