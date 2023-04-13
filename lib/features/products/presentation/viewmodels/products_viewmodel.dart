// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/products/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/states/products_state.dart';

import '../../domain/models/product.dart';

class ProductsViewModel extends StateNotifier<ProductsState> {
  GetProductsUsecase getProductsUsecase;
  ProductsViewModel({
    required this.getProductsUsecase,
  }) : super(const ProductsState.initial()) {
    getProducts();
  }

  ProductsPagination? _productsPagination;

  void getProducts() async {
    state = const ProductsState.loading();
    final either = await getProductsUsecase();
    either.fold((productsPagination) {
      _productsPagination = productsPagination;
      state = ProductsState.loaded(
          products: productsPagination.data,
          isLastPage: productsPagination.nextPage == null);
    }, (failure) {
      if (failure is OfflineFailure) {
        state = const ProductsState.error(error: 'no_internet');
      } else if (failure is ServerFailure) {
        state = const ProductsState.error(error: 'went_wrong');
      } else if (failure is ProductsFailure) {
        state = const ProductsState.error(error: 'went_wrong');
      }
    });
  }

  void getNextProducts() async {
    if (_productsPagination != null) {
      state = ProductsState.nextLoading(products: _productsPagination!.data);
      if (_productsPagination!.nextPage != null) {
        final either = await getProductsUsecase(_productsPagination!.nextPage);
        either.fold((productsPagination) {
          List<Product> products = [
            ..._productsPagination!.data,
            ...productsPagination.data
          ];
          _productsPagination = ProductsPagination(
              data: products, nextPage: productsPagination.nextPage);
          state = ProductsState.loaded(
              products: products,
              isLastPage: productsPagination.nextPage == null);
        }, (failure) {
          if (failure is OfflineFailure) {
            state = ProductsState.nextError(
                products: _productsPagination!.data, error: 'no_internet');
          } else if (failure is ServerFailure) {
            state = ProductsState.nextError(
                products: _productsPagination!.data, error: 'went_wrong');
          } else if (failure is ProductsFailure) {
            state = ProductsState.nextError(
                products: _productsPagination!.data, error: 'went_wrong');
          }
        });
      } else {
        state = ProductsState.loaded(
            products: _productsPagination!.data, isLastPage: true);
      }
    } else {
      getProducts();
    }
  }
}
