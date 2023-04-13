// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/providers.dart';

class CartSummaryWidget extends ConsumerStatefulWidget {
  const CartSummaryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartSummaryWidgetState();
}

class _CartSummaryWidgetState extends ConsumerState<CartSummaryWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(cartProvider.notifier).getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    return state.maybeWhen(
      orElse: () => Container(),
      loaded: (cart) => CartSummaryTextsWidget(
          itemsNumber: cart.itemsNumber,
          totalPriceValue: cart.total.value,
          currency: cart.total.currency),
      adding: (cart, _) => cart != null
          ? CartSummaryTextsWidget(
              itemsNumber: cart.itemsNumber,
              totalPriceValue: cart.total.value,
              currency: cart.total.currency)
          : Container(),
      added: (cart, _) => CartSummaryTextsWidget(
          itemsNumber: cart.itemsNumber,
          totalPriceValue: cart.total.value,
          currency: cart.total.currency),
      errorAdd: (__, cart, _) => cart != null
          ? CartSummaryTextsWidget(
              itemsNumber: cart.itemsNumber,
              totalPriceValue: cart.total.value,
              currency: cart.total.currency)
          : Container(),
      removing: (cart, _) => CartSummaryTextsWidget(
          itemsNumber: cart.itemsNumber,
          totalPriceValue: cart.total.value,
          currency: cart.total.currency),
      removed: (cart) => CartSummaryTextsWidget(
          itemsNumber: cart.itemsNumber,
          totalPriceValue: cart.total.value,
          currency: cart.total.currency),
      errorRemove: (__, cart, _) => CartSummaryTextsWidget(
          itemsNumber: cart.itemsNumber,
          totalPriceValue: cart.total.value,
          currency: cart.total.currency),
    );
  }
}

class CartSummaryTextsWidget extends StatelessWidget {
  final int itemsNumber;
  final String totalPriceValue;
  final String currency;
  const CartSummaryTextsWidget({
    required this.itemsNumber,
    required this.totalPriceValue,
    required this.currency,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('items_number',
                      style: TextStyle(color: CColors.orange, fontSize: 18.sp))
                  .tr(),
              Text('$itemsNumber',
                  style: TextStyle(color: CColors.orange, fontSize: 18.sp)),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total_amount',
                      style: TextStyle(color: CColors.orange, fontSize: 18.sp))
                  .tr(),
              Text('$totalPriceValue $currency',
                  style: TextStyle(color: CColors.orange, fontSize: 18.sp)),
            ],
          ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}
