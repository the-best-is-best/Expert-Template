import 'package:chat_ui/app/di.dart';
import 'package:chat_ui/app/resources/l10n/language_manager.dart';
import 'package:chat_ui/app/resources/routes_manger.dart';
import 'package:chat_ui/app/resources/theme_manager.dart';
import 'package:chat_ui/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(415, 898),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(di()),
          )
        ],
        child: MitXMaterialApp(
          translations: LanguageManager(),
          locale: MitX.locale ?? const Locale("en"),
          fallbackLocale: const Locale("en"),
          debugShowCheckedModeBanner: false,
          theme: themeDataLight,
          title: 'Flutter Demo',
          initialRoute: Routes.splashRoute,
          mitXPages: RouteManager.generateRoutes,
        ),
      ),
    );
  }
}
