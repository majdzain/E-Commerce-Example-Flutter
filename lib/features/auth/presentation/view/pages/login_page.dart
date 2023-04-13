import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/utils/functions/display_snackbar.dart';
import 'package:e_commerce_example_flutter/core/widgets/qit_text_field.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError, _passwordError;

  void _onSubmitted() {
    FocusScope.of(context).unfocus();
    bool isError = false;
    if (_emailController.text.isEmpty) {
      isError = true;
      setState(() {
        _emailError = 'required_field'.tr();
      });
    }
    if (_passwordController.text.isEmpty) {
      isError = true;
      setState(() {
        _passwordError = 'required_field'.tr();
      });
    }
    if (!isError) {
      if (!ref.read(authProvider).isLoading) {
        ref
            .read(authProvider.notifier)
            .login(_emailController.text, _passwordController.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('products');
      } else {
        String? error = next.getLoginError;
        if (error != null) {
          displaySnackbar(context, error);
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login'.tr(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('settings'),
            icon: const Icon(Icons.settings, size: 30),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                QitTextField(
                    onChanged: (txt) {
                      if (txt.isNotEmpty) {
                        setState(() {
                          _emailError = null;
                        });
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                    suffixIcon: const Icon(Icons.person_sharp, size: 30),
                    labelText: 'email'.tr(),
                    controller: _emailController),
                const SizedBox(height: 8),
                QitTextField(
                    onChanged: (txt) {
                      if (txt.isNotEmpty) {
                        setState(() {
                          _passwordError = null;
                        });
                      }
                    },
                    errorText: _passwordError,
                    suffixIcon: const Icon(Icons.lock, size: 30),
                    labelText: 'password'.tr(),
                    obscureText: true,
                    onSubmitted: (_) => _onSubmitted(),
                    controller: _passwordController),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: state.isLoading ? null : _onSubmitted,
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
                            loggingIn: () => const CircularProgressIndicator(
                                color: Colors.white),
                            loggedIn: (_) => const Icon(Icons.done,
                                color: Colors.white, size: 30)),
                        const SizedBox(width: 10),
                        Text(
                          state.maybeWhen(
                              orElse: () => 'login',
                              loggingIn: () => 'logging_in',
                              loggedIn: (_) => 'done'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ).tr(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(authProvider);
                    return state.maybeWhen(
                      orElse: () => Container(),
                      loginError: (errors, error) {
                        if (errors != null) {
                          return ListView.separated(
                            itemBuilder: (context, index) => Center(
                                child: Text(
                              errors[index],
                              style: const TextStyle(color: Colors.red),
                            ).tr()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: errors.length,
                            shrinkWrap: true,
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.of(context).popAndPushNamed('register'),
                    child: const Text(
                      'do_not_have_account',
                      style: TextStyle(
                        color: CColors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ).tr())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
