// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/states/products_state.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../widgets/products_widget.dart';

class ProductsPage extends ConsumerWidget {
  ProductsPage({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        if (!ref.read(productsProvider).isLoading) {
          ref.read(productsProvider.notifier).getNextProducts();
        }
      }
    });
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        restorationId: "products_list",
        slivers: const [
          CustomAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          ProductItemsWidget(),
          NoMoreItems(),
          OnNextBottomWidget(),
        ],
      ),
    );
  }
}

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      title: const Text('products').tr(),
      actions: [
        state.maybeWhen(
          orElse: () => PopupMenuButton<int>(
              child: const Icon(
                Icons.more_vert_rounded,
                size: 31,
              ),
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).pushNamed('login');
                    break;
                  case 1:
                    Navigator.of(context).pushNamed('register');
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('settings');
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: const Text('login').tr(),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: const Text('register').tr(),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: const Text('settings').tr(),
                  )
                ];
              }),
          loggedIn: (_) => const CartIcon(),
          checked: (_) => const CartIcon(),
          registered: (_) => const CartIcon(),
        ),
      ],
      leading: state.whenOrNull(
        checked: (user) => ProfileIcon(userFirstCharacter: user.name[0]),
        loggedIn: (user) => ProfileIcon(userFirstCharacter: user.name[0]),
        registered: (user) => ProfileIcon(userFirstCharacter: user.name[0]),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed('cart'),
      icon: const Icon(
        Icons.shopping_cart,
        size: 31,
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  final String userFirstCharacter;
  const ProfileIcon({
    required this.userFirstCharacter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed('settings'),
      icon: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(userFirstCharacter, style: TextStyle(fontSize: 20.sp))),
    );
  }
}

class NoMoreItems extends ConsumerWidget {
  const NoMoreItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsProvider);

    return SliverToBoxAdapter(
      child: state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loaded: (_, lastPage) {
            return lastPage
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Text(
                      'end_results',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CColors.orange, fontSize: 20.sp),
                    ).tr(),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}

class OnNextBottomWidget extends StatelessWidget {
  const OnNextBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(40),
      sliver: SliverToBoxAdapter(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(productsProvider);
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            nextLoading: (items) =>
                const Center(child: CircularProgressIndicator()),
            nextError: (message, _) => Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () => ref
                            .read(productsProvider.notifier)
                            .getNextProducts(),
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.red,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
