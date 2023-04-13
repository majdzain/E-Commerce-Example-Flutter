import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/core/utils/functions/display_snackbar.dart';
import 'package:e_commerce_example_flutter/core/widgets/qit_text_field.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  String? _emailError, _nameError, _passwordError, _rePasswordError;

  void _onSubmitted() {
    FocusScope.of(context).unfocus();
    bool isError = false;
    if (_emailController.text.isEmpty) {
      isError = true;
      setState(() {
        _emailError = 'required_field'.tr();
      });
    }
    if (_nameController.text.isEmpty) {
      isError = true;
      setState(() {
        _nameError = 'required_field'.tr();
      });
    }
    if (_passwordController.text.isEmpty) {
      isError = true;
      setState(() {
        _passwordError = 'required_field'.tr();
      });
    }
    if (_rePasswordController.text.isEmpty) {
      isError = true;
      setState(() {
        _rePasswordError = 'required_field'.tr();
      });
    }
    if (!isError) {
      if (!ref.read(authProvider).isLoading) {
        ref.read(authProvider.notifier).register(
            _emailController.text,
            _nameController.text,
            _passwordController.text,
            _rePasswordController.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.isRegistered) {
        Navigator.of(context).pushReplacementNamed('products');
      } else {
        String? error = next.getRegisterError;
        if (error != null) {
          displaySnackbar(context, error);
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('register_title'.tr(), style: TextStyle(fontSize: 17.sp)),
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
                          _nameError = null;
                        });
                      }
                    },
                    errorText: _nameError,
                    labelText: 'name'.tr(),
                    controller: _nameController),
                const SizedBox(height: 8),
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
                    controller: _passwordController),
                const SizedBox(height: 10),
                QitTextField(
                    onChanged: (txt) {
                      if (txt.isNotEmpty) {
                        setState(() {
                          _rePasswordError = null;
                        });
                      }
                    },
                    errorText: _rePasswordError,
                    labelText: 're_password'.tr(),
                    obscureText: true,
                    onSubmitted: (_) => _onSubmitted(),
                    controller: _rePasswordController),
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
                            orElse: () => const Icon(Icons.person_add_rounded,
                                color: Colors.white, size: 30),
                            registering: () => const CircularProgressIndicator(
                                color: Colors.white),
                            registered: (_) => const Icon(Icons.done,
                                color: Colors.white, size: 30)),
                        const SizedBox(width: 10),
                        Text(
                          state.maybeWhen(
                              orElse: () => 'register',
                              registering: () => 'registering',
                              registered: (_) => 'done'),
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
                      registerError: (errors, error) {
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
                        Navigator.of(context).popAndPushNamed('login'),
                    child: const Text(
                      'already_have_account',
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
