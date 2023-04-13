// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';

class CartItemWidget extends ConsumerStatefulWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends ConsumerState<CartItemWidget> {
  Product? product;
  String? error;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(cartProvider.notifier).getProductById(
          widget.cartItem.productId,
          (prod) => mounted
              ? setState(() {
                  error = null;
                  product = prod;
                })
              : null,
          (err) => mounted
              ? setState(() {
                  error = err;
                  product = null;
                })
              : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    bool isPhone = MediaQuery.of(context).size.width < 600;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5),
            ],
            color: Colors.white),
        child: Stack(
          children: [
            Column(children: [
              Expanded(
                child: product != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(
                          product!
                              .image.conversions[isPhone ? 'medium' : 'large'],
                          fit: BoxFit.fill,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                                child: Center(
                                    child: Icon(Icons.error_rounded,
                                        color: Colors.red)));
                          },
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : error != null
                        ? Center(
                            child: Text(error!,
                                style: const TextStyle(color: Colors.red)))
                        : const Center(child: CircularProgressIndicator()),
              ),
              product != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: Text(
                        product!.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.normal),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('unit_price',
                        style: TextStyle(
                          color: CColors.orange,
                          fontSize: 14.sp,
                        )).tr(),
                    Expanded(
                      child: Text(
                          '${widget.cartItem.unitPrice.value} ${widget.cartItem.unitPrice.currency}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: CColors.orange,
                            fontSize: 12.sp,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('quantity',
                            style: TextStyle(
                                color: CColors.orange,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal))
                        .tr(),
                    Expanded(
                      child: Text('${widget.cartItem.quantity}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: CColors.orange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('total_price',
                            style: TextStyle(
                                color: CColors.orange,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal))
                        .tr(),
                    Expanded(
                      child: Text(
                          '${double.parse(widget.cartItem.total.value)} ${widget.cartItem.total.currency}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: CColors.orange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
            ]),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: state.maybeWhen(
                  orElse: () => () => ref
                      .read(cartProvider.notifier)
                      .removeFromCart(widget.cartItem.productId),
                  removing: (_, productId) =>
                      productId == widget.cartItem.productId
                          ? null
                          : () => ref
                              .read(cartProvider.notifier)
                              .removeFromCart(widget.cartItem.productId),
                ),
                icon: state.maybeWhen(
                    orElse: () =>
                        const Icon(Icons.delete_rounded, color: Colors.red),
                    removing: (_, productId) => productId ==
                            widget.cartItem.productId
                        ? const CircularProgressIndicator(color: Colors.red)
                        : const Icon(Icons.delete_rounded, color: Colors.red)),
              ),
            )
          ],
        ));
  }
}
