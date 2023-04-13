import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/states/cart_state.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/viewmodels/cart_viewmodel.dart';
import 'package:e_commerce_example_flutter/injection_container.dart' as ic;

final cartProvider = StateNotifierProvider<CartViewModel, CartState>((ref) {
  return ic.sl<CartViewModel>();
});
