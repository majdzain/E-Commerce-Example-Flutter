import 'package:get_it/get_it.dart';
import 'package:e_commerce_example_flutter/core/network/network_info.dart';
import 'package:e_commerce_example_flutter/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/check_token_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/logout_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:e_commerce_example_flutter/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/viewmodels/cart_viewmodel.dart';
import 'package:e_commerce_example_flutter/features/products/data/datasources/products_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/products/data/repositories/products_repository_impl.dart';
import 'package:e_commerce_example_flutter/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:e_commerce_example_flutter/features/products/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/viewmodels/products_viewmodel.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //*? features
  //* auth
  //!viewmodels
  sl.registerLazySingleton(() => AuthViewModel(
      loginUsecase: sl(),
      registerUsecase: sl(),
      logoutUsecase: sl(),
      checkTokenUsecase: sl()));
  //!usecases
  sl.registerLazySingleton(
      () => LoginUsecase(authRepository: sl<AuthRepositoryImpl>()));
  sl.registerLazySingleton(
      () => RegisterUsecase(authRepository: sl<AuthRepositoryImpl>()));
  sl.registerLazySingleton(
      () => LogoutUsecase(authRepository: sl<AuthRepositoryImpl>()));
  sl.registerLazySingleton(
      () => CheckTokenUsecase(authRepository: sl<AuthRepositoryImpl>()));
  //!repositories
  sl.registerLazySingleton(() => AuthRepositoryImpl(
        authRemoteDatasource: sl(),
        networkInfo: sl<NetworkInfoImpl>(),
      ));
  //!datasources
  sl.registerLazySingleton(() => AuthRemoteDatasource());

  //* cart
  //!viewmodels
  sl.registerLazySingleton(() => CartViewModel(
      addToCartUsecase: sl(),
      getCartUsecase: sl(),
      getProductByIdUsecase: sl(),
      removeFromCartUsecase: sl()));
  //!usecases
  sl.registerLazySingleton(
      () => AddToCartUsecase(cartRepository: sl<CartRepositoryImpl>()));
  sl.registerLazySingleton(
      () => GetCartUsecase(cartRepository: sl<CartRepositoryImpl>()));
  sl.registerLazySingleton(
      () => RemoveFromCartUsecase(cartRepository: sl<CartRepositoryImpl>()));

  //!repositories
  sl.registerLazySingleton(() => CartRepositoryImpl(
        cartRemoteDatasource: sl(),
        networkInfo: sl<NetworkInfoImpl>(),
      ));
  //!datasources
  sl.registerLazySingleton(() => CartRemoteDatasource());

  //* products
  //!viewmodels
  sl.registerLazySingleton(() => ProductsViewModel(getProductsUsecase: sl()));
  sl.registerLazySingleton(() => ProductViewModel(getProductByIdUsecase: sl()));
  //!usecases
  sl.registerLazySingleton(() =>
      GetProductsUsecase(productsRepository: sl<ProductsRepositoryImpl>()));
  sl.registerLazySingleton(() =>
      GetProductByIdUsecase(productsRepository: sl<ProductsRepositoryImpl>()));

  //!repositories
  sl.registerLazySingleton(() => ProductsRepositoryImpl(
        productsRemoteDatasource: sl(),
        networkInfo: sl<NetworkInfoImpl>(),
      ));
  //!datasources
  sl.registerLazySingleton(() => ProductsRemoteDatasource());

  //*? core
  //* network
  sl.registerLazySingleton(() => NetworkInfoImpl());
}
