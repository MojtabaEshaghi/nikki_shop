import 'package:nikki_shop/generated/json/base/json_convert_content.dart';
import 'package:nikki_shop/data/models/auth_info_entity.dart';

AuthInfoEntity $AuthInfoEntityFromJson(Map<String, dynamic> json) {
	final AuthInfoEntity authInfoEntity = AuthInfoEntity();
	final String? tokenType = jsonConvert.convert<String>(json['token_type']);
	if (tokenType != null) {
		authInfoEntity.tokenType = tokenType;
	}
	final int? expiresIn = jsonConvert.convert<int>(json['expires_in']);
	if (expiresIn != null) {
		authInfoEntity.expiresIn = expiresIn;
	}
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		authInfoEntity.accessToken = accessToken;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
	if (refreshToken != null) {
		authInfoEntity.refreshToken = refreshToken;
	}
	return authInfoEntity;
}

Map<String, dynamic> $AuthInfoEntityToJson(AuthInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	data['access_token'] = entity.accessToken;
	data['refresh_token'] = entity.refreshToken;
	return data;
}