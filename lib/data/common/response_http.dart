import 'package:dio/dio.dart';
import 'package:nikki_shop/common/exeption.dart';

mixin HttpResponseValidator{

  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}