
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/home/model/product_model.dart';
import '../errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProduct( String id);
}