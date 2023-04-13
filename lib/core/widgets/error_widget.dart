// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

class ErrorFetchWidget extends StatelessWidget {
  final String error;
  final VoidCallback? onRetry;
  const ErrorFetchWidget({
    required this.error,
    this.onRetry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          onRetry != null
              ? IconButton(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh,
                      color: CColors.orange, size: 50))
              : Container(),
          const SizedBox(height: 10),
          Text(error, style: TextStyle(fontSize: 18.sp, color: CColors.orange))
        ],
      ),
    ));
  }
}
