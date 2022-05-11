import 'package:dio/dio.dart';
import 'package:nikki_shop/data/common/response_http.dart';
import 'package:nikki_shop/data/models/banner_entity.dart';

abstract class IBannerDaraSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource
    with HttpResponseValidator
    implements IBannerDaraSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);

  @override
  Future<List<BannerEntity>> getAll() async {
    final response = await httpClient.get("banner/slider");
    List<BannerEntity> res = [];
    validateResponse(response);
    for (var element in (response.data as List)) {
      res.add(BannerEntity.fromJson(element));
    }
    return res;
  }
}
