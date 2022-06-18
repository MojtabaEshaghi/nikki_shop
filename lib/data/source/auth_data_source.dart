import 'package:dio/dio.dart';
import 'package:nikki_shop/data/models/auth_info.dart';


abstract class IAuthDataSource {
  Future<AuthInfo> login(String userName, String password);

  Future<AuthInfo> register(String userName, String password);

  Future<AuthInfo> refreshToken(String token);
}

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio httpClient;

  AuthRemoteDataSource(this.httpClient);

  @override
  Future<AuthInfo> login(String userName, String password) {
    AuthInfo("pas")

    final response = httpClient.post("auth/token", data:)
  }

  @override
  Future<AuthInfo> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<AuthInfo> register(String userName, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
