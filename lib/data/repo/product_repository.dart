import 'package:nikki_shop/data/common/http_client.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/data/source/product_data_source.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAll(int sort);

  Future<List<ProductEntity>> searchProduct(String searchTerm);
}

class ProductRepository implements IProductRepository {
  final IProductDataSource dataSource;

  ProductRepository(this.dataSource);

  @override
  Future<List<ProductEntity>> getAll(int sort) => dataSource.getAll(sort);

  @override
  Future<List<ProductEntity>> searchProduct(String searchTerm) =>
      dataSource.searchProduct(searchTerm);
}

final ProductRepository productRepository =
    ProductRepository(ProductRemoteDataSource(httpClient));
