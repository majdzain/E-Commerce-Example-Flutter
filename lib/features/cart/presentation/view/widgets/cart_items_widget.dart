// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/widgets/error_widget.dart';
import 'package:e_commerce_example_flutter/core/widgets/loading_widget.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/widgets/cart_item_widget.dart';

class CartItemsWidget extends ConsumerWidget {
  const CartItemsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    // List<Widget> cartItemWidgets = [];
    return state.when(
      initial: () => Container(),
      loading: () => const LoadingWidget(),
      loaded: (cart) {
        return cart.items.isEmpty
            ? const NoCartItemsWidget()
            : CartItemsGridView(cartItems: cart.items);
      },
      error: (error) => ErrorFetchWidget(
          error: error.tr(),
          onRetry: () => ref.read(cartProvider.notifier).getCart()),
      adding: (cart, _) {
        if (cart != null) {
          return cart.items.isEmpty
              ? const NoCartItemsWidget()
              : CartItemsGridView(cartItems: cart.items);
        } else {
          return const LoadingWidget();
        }
      },
      added: (cart, _) {
        return cart.items.isEmpty
            ? const NoCartItemsWidget()
            : CartItemsGridView(cartItems: cart.items);
      },
      errorAdd: (error, cart, _) {
        if (cart != null) {
          return cart.items.isEmpty
              ? const NoCartItemsWidget()
              : CartItemsGridView(cartItems: cart.items);
        } else {
          return Center(child: Text(error));
        }
      },
      removing: (cart, _) {
        return cart.items.isEmpty
            ? const NoCartItemsWidget()
            : CartItemsGridView(cartItems: cart.items);
      },
      removed: (cart) {
        return cart.items.isEmpty
            ? const NoCartItemsWidget()
            : CartItemsGridView(cartItems: cart.items);
      },
      errorRemove: (error, cart, cartItemId) {
        return cart.items.isEmpty
            ? const NoCartItemsWidget()
            : CartItemsGridView(cartItems: cart.items);
      },
    );
  }
}

class CartItemsGridView extends StatelessWidget {
  final List<CartItem> cartItems;
  const CartItemsGridView({
    required this.cartItems,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width < 600;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPhone ? 2 : 4,
          childAspectRatio: isPhone ? 0.6 : 0.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: cartItems.length,
      itemBuilder: (context, index) => CartItemWidget(
          key: Key('cart_item_${cartItems[index].id}'),
          cartItem: cartItems[index]),
    );
  }
}

class NoCartItemsWidget extends StatelessWidget {
  const NoCartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'no_cart_items',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 19.sp,
        color: CColors.orange,
      ),
    ).tr());
  }
}
