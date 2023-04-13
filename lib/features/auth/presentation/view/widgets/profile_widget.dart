// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/utils/functions/display_snackbar.dart';
import 'package:e_commerce_example_flutter/core/widgets/qit_text_field.dart';

import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [ProfileDetailsWidget(), ProfileButton()],
    );
  }
}

class ProfileDetailsWidget extends ConsumerStatefulWidget {
  const ProfileDetailsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends ConsumerState<ProfileDetailsWidget> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = ref.read(authProvider.notifier).user;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.isLoggedOut) {
        setState(() {
          user = null;
        });
      } else {
        String? error = next.getLogoutError;
        if (error != null) {
          displaySnackbar(context, error);
        }
      }
    });
    return user != null
        ? Column(children: [
            CircleAvatar(
                radius: 80,
                backgroundColor: CColors.orange,
                child: Text(user!.name[0],
                    style: TextStyle(fontSize: 60.sp, color: Colors.white))),
            const SizedBox(height: 10),
            QitTextField(
              labelText: 'name'.tr(),
              controller: TextEditingController(text: user!.name),
              enabled: false,
            ),
            const SizedBox(
              height: 8,
            ),
            QitTextField(
              labelText: 'email'.tr(),
              controller: TextEditingController(text: user!.email),
              enabled: false,
            ),
            const SizedBox(height: 10),
          ])
        : Container();
  }
}

class ProfileButton extends ConsumerWidget {
  const ProfileButton({super.key});

  void logout(WidgetRef ref) {
    ref.read(authProvider.notifier).logout();
  }

  void login(BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    const logoutIcon = Icon(Icons.logout, color: Colors.white, size: 30);
    return ElevatedButton(
      onPressed: state.maybeWhen(
          orElse: () => () => login(context),
          loggingOut: () => null,
          loggedIn: (_) => () => logout(ref),
          registered: (_) => () => logout(ref),
          checked: (_) => () => logout(ref)),
      style: ElevatedButton.styleFrom(primary: CColors.orange),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            state.maybeWhen(
              orElse: () => const Icon(Icons.login_rounded,
                  color: Colors.white, size: 30),
              loggingOut: () =>
                  const CircularProgressIndicator(color: Colors.white),
              loggedIn: (_) => logoutIcon,
              registered: (_) => logoutIcon,
              checked: (_) => logoutIcon,
            ),
            const SizedBox(width: 10),
            Text(
              state.maybeWhen(
                  orElse: () => 'login',
                  loggingOut: () => 'logging_out',
                  loggedIn: (_) => 'logout',
                  registered: (_) => 'logout',
                  checked: (_) => 'logout'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
