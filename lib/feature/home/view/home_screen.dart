import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/setup_service_locator.dart';
import 'package:flutter_application_1/feature/home/widget/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repos/home_repo_impl.dart';
import '../manager/product_cubit.dart';
import '../widget/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, 'Products'),
      body:  BlocProvider(
        create: (context) => ProductCubit(
          getIt.get<HomeRepoImpl>(),
        )..fetchProduct( ''),

        child: BlocBuilder <ProductCubit, ProductState>(
          builder: (context, state) {
            final cubit = ProductCubit.get(context);
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (state is ProductsSuccess) {
              return ProductList(cubit: cubit, size: size);

            } else if (state is ProductsFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      )
    );
  }
}
