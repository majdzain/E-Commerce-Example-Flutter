import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/utils/functions/display_snackbar.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/states/cart_state.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';

class AddToCartDialogWidget extends StatefulWidget {
  final Product product;
  const AddToCartDialogWidget({required this.product, super.key});

  @override
  State<AddToCartDialogWidget> createState() => _AddToCartDialogWidgetState();
}

class _AddToCartDialogWidgetState extends State<AddToCartDialogWidget> {
  int productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('add_product_to_cart',
                  style: TextStyle(
                    fontSize: 18.sp,
                  )).tr(),
              const SizedBox(height: 15),
              Text(
                widget.product.title,
                style: TextStyle(fontSize: 17.sp),
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    productQuantity > 1
                        ? SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  productQuantity--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                // padding: const EdgeInsets.all(20),
                                backgroundColor: Colors.red,
                              ),
                              child: const Icon(Icons.remove_rounded,
                                  color: Colors.white),
                            ),
                          )
                        : Container(),
                    Text(
                      '$productQuantity',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            productQuantity++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          // padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.green,
                        ),
                        child:
                            const Icon(Icons.add_rounded, color: Colors.white),
                      ),
                    ),
                  ]),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('unit_price',
                          style:
                              TextStyle(color: CColors.orange, fontSize: 17.sp))
                      .tr(),
                  Text(
                      '${widget.product.price.value} ${widget.product.price.currency}',
                      style: TextStyle(color: CColors.orange, fontSize: 17.sp)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total_price',
                          style:
                              TextStyle(color: CColors.orange, fontSize: 17.sp))
                      .tr(),
                  Text(
                      '${(double.parse(widget.product.price.value) * productQuantity).toStringAsFixed(2)} ${widget.product.price.currency}',
                      style: TextStyle(color: CColors.orange, fontSize: 17.sp)),
                ],
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(cartProvider);
                  if (state.isAdded == widget.product.id) {
                    return Container();
                  }
                  ref.listen(cartProvider, (previous, next) {
                    if (next.isAdded == widget.product.id) {
                      displaySnackbar(
                          context, 'added_to_cart_successfuly'.tr());
                      Navigator.of(context).pop();
                    } else {
                      String? error = next.isAddError;
                      if (error != null) {
                        displaySnackbar(context, error.tr());
                      }
                    }
                  });

                  return ElevatedButton(
                    onPressed: state.maybeWhen(
                        orElse: () => () => ref
                            .read(cartProvider.notifier)
                            .addToCart(widget.product.id, productQuantity),
                        adding: (_, productId) => productId == widget.product.id
                            ? null
                            : () => ref
                                .read(cartProvider.notifier)
                                .addToCart(widget.product.id, productQuantity)),
                    style: ElevatedButton.styleFrom(primary: CColors.orange),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          state.maybeWhen(
                              orElse: () => const Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.white),
                              adding: (_, productId) => productId ==
                                      widget.product.id
                                  ? const CircularProgressIndicator()
                                  : const Icon(Icons.add_shopping_cart_rounded,
                                      color: Colors.white)),
                          const SizedBox(width: 10),
                          Text(
                            state.maybeWhen(
                                orElse: () => 'add_to_cart',
                                adding: (_, productId) =>
                                    productId == widget.product.id
                                        ? 'adding_to_cart'
                                        : 'add_to_cart'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ).tr(),
                        ],
                      ),
                    ),
                  );
                },
              )
            ]));
  }
}
