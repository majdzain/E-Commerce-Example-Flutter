import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

class AccountRequiredDialogWidget extends StatelessWidget {
  const AccountRequiredDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('account_required'.tr(),
                  style: TextStyle(
                    fontSize: 17.sp,
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => Navigator.of(context).popAndPushNamed('login'),
                style: ElevatedButton.styleFrom(primary: CColors.orange),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.login_rounded,
                          color: Colors.white, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        'login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ).tr(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('register'),
                style: ElevatedButton.styleFrom(primary: CColors.orange),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.person_add_rounded,
                          color: Colors.white, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        'register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ).tr(),
                    ],
                  ),
                ),
              ),
            ]));
  }
}
