import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../utils/styles/text.dart';
import '../../home/model/product_model.dart';
import '../../home/widget/appbar_widget.dart';
import '../widget/product_description.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, 'Product Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? '',
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) {
                      return  Center(
                        child: Image.asset(Assets.imagesDownload),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.title!,
                style: AppStyles.styleRegular25(context),
              ),
              const SizedBox(height: 20),
              Text('Description : ', style: AppStyles.styleRegular20(context)),
              const SizedBox(height: 8),
              ProductDescription(product: product),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    " EGP ${product.price!}",
                    style: AppStyles.styleRegular15(context),
                  ),
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      Text(
                        "${product.price ?? ''}",
                        style: AppStyles.styleRegular14(context),
                      ),
                      Text(
                        "EGP",
                        style: AppStyles.styleRegular14(context),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 20,
                      ),
                      Text(
                        " ${product.rating!.rate ?? ''}",
                        style: AppStyles.styleRegular15(context),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      Text(
                        " ${product.rating!.count ?? ''} Orders",
                        style: AppStyles.styleRegular15(context)
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style: AppStyles.styleRegular22(context)
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.heart,
                            color: Colors.blue, size: 25),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
