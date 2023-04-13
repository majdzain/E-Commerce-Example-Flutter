// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_example_flutter/core/errors/enums.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/products/domain/usecases/get_product_by_id_usecase.dart';

import 'package:e_commerce_example_flutter/features/products/presentation/states/product_state.dart';

class ProductViewModel extends StateNotifier<ProductState> {
  GetProductByIdUsecase getProductByIdUsecase;
  ProductViewModel({required this.getProductByIdUsecase})
      : super(const ProductState.initial());

  void getProductById(int productId) async {
    state = ProductState.loading(productId: productId);
    final either = await getProductByIdUsecase(productId);
    either.fold((product) {
      state = ProductState.loaded(product: product, productId: productId);
    }, (failure) {
      if (failure is OfflineFailure) {
        state = ProductState.error(productId: productId, error: 'no_internet');
      } else if (failure is ServerFailure) {
        state = ProductState.error(productId: productId, error: 'went_wrong');
      } else if (failure is ProductFailure) {
        state = ProductState.error(
            productId: productId,
            error: failure.error != null
                ? getUserMessageFromProductError(failure.error!) ?? 'went_wrong'
                : 'went_wrong');
      }
    });
  }
}
