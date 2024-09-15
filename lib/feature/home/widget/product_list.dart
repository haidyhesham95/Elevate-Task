import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/widget/product_item.dart';

import '../manager/product_cubit.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.cubit, required this.size});
  final ProductCubit cubit ;
  final Size  size;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 25,
        childAspectRatio: 0.78,
      ),
      itemCount: cubit.products.length,
      itemBuilder: (context, index) {
        return ProductItem(cubit: cubit, size: size, index: index);
      },
    );
  }
}
