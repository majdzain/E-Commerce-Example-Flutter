import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:e_commerce_example_flutter/core/pages/settings_page.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/pages/cart_page.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/product_page.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/products_page.dart';

import 'features/auth/presentation/view/pages/login_page.dart';
import 'features/auth/presentation/view/pages/register_page.dart';

class AppRouter {
  static late FluroRouter router;

  static Handler settingsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const SettingsPage();
  });

  static Handler loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginPage();
  });

  static Handler registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const RegisterPage();
  });

  static Handler productsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return ProductsPage();
  });

  static Handler productHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    int? productId = params['productId'] != null
        ? int.parse(params['productId']!.first)
        : null;
    if (productId != null) {
      return ProductPage(productId: productId);
    } else {
      return Center(
        child: Text('not_found'.tr(),
            style: const TextStyle(
              fontSize: 25,
            )),
      );
    }
  });

  static Handler cartHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const CartPage();
  });

  static void configureRoutes(FluroRouter fluroRouter) {
    fluroRouter.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return Center(
        child: Text('not_found'.tr(),
            style: const TextStyle(
              fontSize: 25,
            )),
      );
    });
    fluroRouter.define('/', handler: productsHandler);
    fluroRouter.define('settings', handler: settingsHandler);
    fluroRouter.define('login', handler: loginHandler);
    fluroRouter.define('register', handler: registerHandler);
    fluroRouter.define('products', handler: productsHandler);
    fluroRouter.define('product/:productId',
        handler: productHandler, transitionType: TransitionType.fadeIn);
    fluroRouter.define('cart', handler: cartHandler);
    router = fluroRouter;
  }
}
