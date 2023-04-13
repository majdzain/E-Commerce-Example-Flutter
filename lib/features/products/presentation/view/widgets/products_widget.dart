// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/widgets/error_widget.dart';

import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/providers.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import 'product_widget.dart';

class ProductItemsWidget extends StatelessWidget {
  const ProductItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: Consumer(
          builder: (context, ref, child) {
            final haveAccount = ref.watch(authProvider.notifier).user != null;
            return Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(productsProvider);
                return state.when(
                  initial: () => Container(),
                  loading: () =>
                      const SliverFillRemaining(child: LoadingWidget()),
                  loaded: (products, isLastPage) => products.isEmpty
                      ? const SliverToBoxAdapter(child: NoProductsWidget())
                      : ProductsGridView(
                          products: products, haveAccount: haveAccount),
                  nextLoading: (products) => products.isEmpty
                      ? const SliverToBoxAdapter(child: NoProductsWidget())
                      : ProductsGridView(
                          products: products, haveAccount: haveAccount),
                  error: (message) => SliverFillRemaining(
                      child: ErrorFetchWidget(
                    error: message.tr(),
                    onRetry: () =>
                        ref.read(productsProvider.notifier).getProducts(),
                  )),
                  nextError: (message, products) => products.isEmpty
                      ? const SliverToBoxAdapter(child: NoProductsWidget())
                      : ProductsGridView(
                          products: products, haveAccount: haveAccount),
                );
              },
            );
          },
        ));
  }
}

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  final bool haveAccount;
  const ProductsGridView({
    Key? key,
    required this.products,
    required this.haveAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width < 600;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPhone ? 2 : 4,
          childAspectRatio: isPhone ? 0.65 : 0.8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductWidget(
          key: Key('product_${products[index].id}'),
          product: products[index],
          haveAccount: haveAccount),
    );
  }
}

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'no_products',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 19.sp,
        color: CColors.orange,
      ),
    ).tr());
  }
}
