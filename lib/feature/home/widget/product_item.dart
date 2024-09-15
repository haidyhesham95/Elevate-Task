import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/feature/product_details/view/product_details.dart';
import 'package:flutter_application_1/utils/styles/text.dart';

import '../../../generated/assets.dart';
import '../manager/product_cubit.dart';


class ProductItem extends StatelessWidget {
  final ProductCubit cubit ;
  final Size  size;
  final int index;
  const ProductItem({super.key, required this.cubit,required this.size, required this.index, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      product: cubit.products[index],
                    )),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              height: size.height * 0.14,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: cubit.products[index].image ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return  Center(
                          child: Image.asset(Assets.imagesDownload),
                        );
                      },
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),

                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: 15,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.heart, color: Colors.blue, size: 20),
                        onPressed: () {},
                        iconSize: 18,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  cubit.products[index].title ?? '',
                  maxLines: 1,
                  style: AppStyles.styleRegular18(context),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      " EGP ${cubit.products[index].price ?? ''}",
                      style: AppStyles.styleRegular15(context),
                    ),
                    const SizedBox(width: 5),
                    Row(
                      children: [
                        Text(
                          "${cubit.products[index].price ?? '' }",
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          " Review (${cubit.products[index].rating!.rate ?? ''})",
                          style: AppStyles.styleRegular15(context),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                          size: 20,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 15,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.plus, color: Colors.white, size: 20),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
