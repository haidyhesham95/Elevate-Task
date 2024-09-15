import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/styles/colors.dart';
import '../../../utils/styles/text.dart';
import '../../home/model/product_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ReadMoreText(
        product.description ?? 'No description available',
        trimLines: 4,
        style: AppStyles.regular20(context),
        colorClickableText: AppColors.dark,
        trimMode: TrimMode.Line,
        trimCollapsedText: '...Read more',
        trimExpandedText: ' Read less',
        moreStyle: AppStyles.styleRegular18(context).copyWith(
          color: AppColors.dark.withOpacity(0.6),
        ),
        lessStyle: AppStyles.styleRegular18(context).copyWith(
          color: AppColors.dark.withOpacity(0.6),
        ),
      ),
    );
  }
}
