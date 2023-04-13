// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce_example_flutter/core/errors/enums.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/states/cart_state.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
import 'package:e_commerce_example_flutter/features/products/domain/usecases/get_product_by_id_usecase.dart';

class CartViewModel extends StateNotifier<CartState> {
  GetCartUsecase getCartUsecase;
  AddToCartUsecase addToCartUsecase;
  RemoveFromCartUsecase removeFromCartUsecase;
  GetProductByIdUsecase getProductByIdUsecase;
  Cart? cart;

  CartViewModel({
    required this.getCartUsecase,
    required this.addToCartUsecase,
    required this.removeFromCartUsecase,
    required this.getProductByIdUsecase,
  }) : super(const CartState.initial());

  void getCart() async {
    state = const CartState.loading();
    final either = await getCartUsecase();
    either.fold((cart) {
      state = CartState.loaded(cart: cart);
      this.cart = cart;
    }, (failure) {
      if (failure is OfflineFailure) {
        state = const CartState.error(error: 'no_internet');
      } else if (failure is ServerFailure) {
        state = const CartState.error(error: 'went_wrong');
      } else if (failure is UnauthenticatedFailure) {
        state = const CartState.error(error: 'went_wrong_login_again');
      }
    });
  }

  void addToCart(int productId, int quantity) async {
    state = CartState.adding(cart: cart, productId: productId);
    final either = await addToCartUsecase(productId, quantity);
    either.fold((cart) {
      state = CartState.added(cart: cart, productId: productId);
      this.cart = cart;
    }, (failure) {
      if (failure is OfflineFailure) {
        state = CartState.errorAdd(error: 'no_internet', productId: productId);
      } else if (failure is ServerFailure) {
        state = CartState.errorAdd(error: 'went_wrong', productId: productId);
      } else if (failure is UnauthenticatedFailure) {
        state = CartState.errorAdd(
            error: 'went_wrong_login_again', productId: productId);
      } else if (failure is ProductFailure) {
        state = CartState.errorAdd(
            error: failure.error != null
                ? getUserMessageFromProductError(failure.error!) ?? 'went_wrong'
                : 'went_wrong',
            productId: productId);
      }
    });
  }

  void removeFromCart(int productId) async {
    if (cart != null) {
      state = CartState.removing(
        cart: cart!,
        productId: productId,
      );
      final either = await removeFromCartUsecase(productId);
      either.fold((cart) {
        state = CartState.removed(cart: cart);
        this.cart = cart;
      }, (failure) {
        if (failure is OfflineFailure) {
          state = CartState.errorRemove(
              error: 'no_internet', cart: cart!, productId: productId);
        } else if (failure is ServerFailure) {
          state = CartState.errorRemove(
              error: 'went_wrong', cart: cart!, productId: productId);
        } else if (failure is UnauthenticatedFailure) {
          state = CartState.errorRemove(
              error: 'went_wrong_login_again',
              cart: cart!,
              productId: productId);
        } else if (failure is ProductFailure) {
          state = CartState.errorRemove(
              error: failure.error != null
                  ? getUserMessageFromProductError(failure.error!) ??
                      'went_wrong'
                  : 'went_wrong',
              cart: cart!,
              productId: productId);
        }
      });
    }
  }

  void getProductById(int productId, Function(Product product) onSuccess,
      Function(String error) onError) async {
    final either = await getProductByIdUsecase(productId);
    either.fold((product) {
      onSuccess(product);
    }, (failure) {
      if (failure is OfflineFailure) {
        onError('no_internet');
      } else if (failure is ServerFailure) {
        onError('went_wrong');
      } else if (failure is ProductFailure) {
        onError(failure.error != null
            ? getUserMessageFromProductError(failure.error!) ?? 'went_wrong'
            : 'went_wrong');
      }
    });
  }
}
