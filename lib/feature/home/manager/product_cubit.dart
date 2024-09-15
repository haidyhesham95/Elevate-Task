import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/product_model.dart';
import '../../../repos/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);


  final HomeRepo homeRepo;
  List<ProductModel> products = [];


  Future<void> fetchProduct( String id) async {
    emit(ProductsLoading());
    var result = await homeRepo.fetchProduct(id);

    result.fold(
            (failure) => emit(ProductsFailure(failure.message)),
            (products) {
          this.products = products;
          emit(ProductsSuccess(products));
        }
    );
  }

}
