import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/dialog_widgets/account_required_dialog_widget.dart';
import 'package:e_commerce_example_flutter/core/widgets/error_widget.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/dialog_widgets/add_to_cart_dialog_widget.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/providers.dart';

import '../../../../../core/widgets/loading_widget.dart';

class ProductPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductPage({required this.productId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => ref
            .read(productProvider.notifier)
            .getProductById(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productProvider);
    final haveAccount = ref.read(authProvider.notifier).user != null;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'product'.tr(),
          ),
          centerTitle: true,
          actions: state.maybeWhen(
              orElse: () => null,
              loaded: (id, product) {
                if (id == widget.productId) {
                  return [
                    IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (c) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: haveAccount
                                    ? AddToCartDialogWidget(
                                        product: product,
                                      )
                                    : const AccountRequiredDialogWidget());
                          }),
                      icon:
                          const Icon(Icons.add_shopping_cart_rounded, size: 30),
                    )
                  ];
                }
                return null;
              }),
        ),
        body: state.when(
            initial: () => Container(),
            loading: (id) =>
                id == widget.productId ? const LoadingWidget() : Container(),
            error: (id, error) => id == widget.productId
                ? ErrorFetchWidget(
                    error: error.tr(),
                    onRetry: () => ref
                        .read(productProvider.notifier)
                        .getProductById(widget.productId),
                  )
                : Container(),
            loaded: (id, product) => id == widget.productId
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              product.image.conversions['large'],
                              fit: BoxFit.fill,
                              height: 400.h,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                    height: 300.h,
                                    child: const Center(
                                        child: Icon(Icons.error_rounded,
                                            color: Colors.red)));
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return SizedBox(
                                  height: 300.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${product.price.value} ${product.price.currency}',
                            style: TextStyle(
                                fontSize: 18.sp, color: CColors.orange),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.description,
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()));
  }
}
