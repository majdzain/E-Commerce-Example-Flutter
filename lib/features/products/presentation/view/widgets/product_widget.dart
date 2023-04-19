import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

import '../../../../../core/dialog_widgets/account_required_dialog_widget.dart';
import '../../../../cart/presentation/view/dialog_widgets/add_to_cart_dialog_widget.dart';
import '../../../domain/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final bool haveAccount;
  const ProductWidget(
      {required this.product, required this.haveAccount, super.key});

  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width < 600;
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed('product/${product.id}'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        overlayColor:
            MaterialStateProperty.all(CColors.orange.withOpacity(0.2)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                product.image.conversions[isPhone ? 'medium' : 'large'],
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                      child: Center(
                          child: Icon(Icons.error_rounded, color: Colors.red)));
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Text(
              product.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  product.price.formatted,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: CColors.orange,
                      fontWeight: FontWeight.normal),
                ),
              ),
              IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (c) {
                        return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: haveAccount
                                ? AddToCartDialogWidget(
                                    product: product,
                                  )
                                : const AccountRequiredDialogWidget());
                      }),
                  icon: const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: CColors.orange,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
