import 'package:nikki_shop/data/common/http_client.dart';
import 'package:nikki_shop/data/models/banner_entity.dart';
import 'package:nikki_shop/data/source/banner_data_source.dart';

abstract class IBannerRepository {
  Future<List<BannerEntity>> getAll();
}

class BannerRepository implements IBannerRepository {
  final IBannerDaraSource dataSource;

  BannerRepository(this.dataSource);

  @override
  Future<List<BannerEntity>> getAll() => dataSource.getAll();
}

final BannerRepository bannerRepository =
    BannerRepository(BannerRemoteDataSource(httpClient));
