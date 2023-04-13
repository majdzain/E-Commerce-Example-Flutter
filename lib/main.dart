import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/app_router.dart';
import 'package:e_commerce_example_flutter/core/cache/cache_helper.dart';
import 'package:e_commerce_example_flutter/core/network/dio_helper.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/products_page.dart';
import 'core/constants/theme/colors.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  await ic.init();
  await EasyLocalization.ensureInitialized();
  final router = FluroRouter();
  AppRouter.configureRoutes(router);
  await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final int red = CColors.orange.red;
    final int green = CColors.orange.green;
    final int blue = CColors.orange.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            key: Key('material_app_with_locale${context.locale.toString()}'),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce App',
            theme: ThemeData(
              primarySwatch: MaterialColor(CColors.orange.value, shades),
              fontFamily: 'Montserrat',
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Montserrat',
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            ),
            onGenerateRoute: AppRouter.router.generator,
          );
        });
  }
}
