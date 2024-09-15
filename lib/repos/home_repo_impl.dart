import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/feature/home/model/product_model.dart';
import 'package:flutter_application_1/utils/api_service.dart';
import '../errors/failure.dart';
import 'home_repo.dart';



class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override

  Future<Either<Failure, List<ProductModel>>> fetchProduct( String id) async {
    try {
      var data = await apiService.getProduct();

        List<ProductModel> products = [];
        for (var item in data) {
          if (item is Map<String, dynamic>) {
            products.add(ProductModel.fromJson(item));
          } else {
            return left(ServerFailure('Unexpected item format in list'));
          }
        }
        return right(products);

    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}