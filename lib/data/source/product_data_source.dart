import 'package:dio/dio.dart';
import 'package:nikki_shop/common/exeption.dart';
import 'package:nikki_shop/data/common/response_http.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/data/repo/product_repository.dart';

abstract class IProductDataSource {
  Future<List<ProductEntity>> getAll(int sort);

  Future<List<ProductEntity>> searchProduct(String searchTerm);
}

class ProductRemoteDataSource
    with HttpResponseValidator
    implements IProductDataSource {
  final Dio httpClient;


  ProductRemoteDataSource(this.httpClient);

  @override
  Future<List<ProductEntity>> getAll(int sort) async {
    final response = await httpClient.get("product/list?sort=$sort");
    validateResponse(response);
    List<ProductEntity> product = [];
    for (var element in (response.data as List)) {
      product.add(ProductEntity.fromJson(element));
    }
    return product;
  }

  @override
  Future<List<ProductEntity>> searchProduct(String searchTerm) async {
    final response = await httpClient.get("product/search?q=$searchTerm");
    validateResponse(response);
    List<ProductEntity> product = [];
    for (var element in (response.data as List)) {
      product.add(ProductEntity.fromJson(element));
    }
    return product;
  }
}
