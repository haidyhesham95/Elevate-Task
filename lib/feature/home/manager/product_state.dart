part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductsLoading extends ProductState {}

final class ProductsSuccess extends ProductState {
  final List<ProductModel> products;

  ProductsSuccess(this.products);
}

final class ProductsFailure extends ProductState {
  final String message;

  ProductsFailure(this.message);
}
