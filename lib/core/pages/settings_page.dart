import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/view/widgets/profile_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings').tr(),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('language'.tr(), style: TextStyle(fontSize: 17.sp)),
                  DropdownButton<String>(
                    value: context.locale.languageCode,
                    icon: const Icon(Icons.arrow_drop_down,
                        color: CColors.orange),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    underline: Container(
                      height: 2,
                      color: CColors.orange,
                    ),
                    onChanged: (data) {
                      if (data != null) {
                        context.setLocale(Locale(data));
                      }
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'en',
                        child: Text('English'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'ar',
                        child: Text('Arabic'),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('about').tr(),
            ],
          ),
        ),
      ),
    );
  }
}
