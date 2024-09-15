import 'package:dio/dio.dart';
class ApiService {
  final Dio dio;

  final baseUrl = "https://fakestoreapi.com/products";

  ApiService(this.dio);

  Future<List<dynamic>> getProduct() async {
    var response = await dio.get(baseUrl);
    return response.data as List<dynamic>;
  }
}

