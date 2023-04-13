import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/states/product_state.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/states/products_state.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/viewmodels/products_viewmodel.dart';
import 'package:e_commerce_example_flutter/injection_container.dart' as ic;

final productsProvider =
    StateNotifierProvider<ProductsViewModel, ProductsState>((ref) {
  return ic.sl<ProductsViewModel>();
});

final productProvider =
    StateNotifierProvider<ProductViewModel, ProductState>((ref) {
  return ic.sl<ProductViewModel>();
});
