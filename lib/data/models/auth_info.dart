/// token_type : "Bearer"
/// expires_in : 31536000
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBhMzNmNDUwOWQ0ODJlMGZiZTY0OGJhM2I0NTQ0YjI3OTYzODRmYjU0YTA2OGQ2YzhmOWE2MzdmZDMyNGM0MzcyNzQxNWNkOTk1MWZmNDIxIn0.eyJhdWQiOiIyIiwianRpIjoiMGEzM2Y0NTA5ZDQ4MmUwZmJlNjQ4YmEzYjQ1NDRiMjc5NjM4NGZiNTRhMDY4ZDZjOGY5YTYzN2ZkMzI0YzQzNzI3NDE1Y2Q5OTUxZmY0MjEiLCJpYXQiOjE2NTUzOTc0MzgsIm5iZiI6MTY1NTM5NzQzOCwiZXhwIjoxNjg2OTMzNDM4LCJzdWIiOiIxNyIsInNjb3BlcyI6W119.OT_USkQJ8QkItbKHU9xBZUgW0WWmLdoM2FrYtJ9Tw0us-oKljRnp4PiVgi7dyN3xqIY56eaL1rAcAt5bjXIzo_bzfXF8DRrFkbxDgT6wUJbYiV8VS6u10JGxvo57H0NV4mmO6Gmfap_2lfKiymw6OFPWcyvYGULtPVNiyIUBcM39k7YggEfp-GuGgYavZjP2J-kKf-l0fEKvgpzSkaCLCogrMXyI5TJtE0TIsEPuRTleMv5LhomilpxmApPwEaD0Rt0gHkjqM5xwq-Diba9Eq1LgWQAske9xtDLCHY0oeSSPhQhNGzozLluyzi_WCmmZ1sQg_vECnfBAeqQEUTWSdzRqae0C4bhysAYAlW5MNGX711VZ0Uf4prqt4YxFfbxwUf2TXQ9dGYMX7-eP6hPQQK_NWdd7QmYqmidnDap_MmH1-F5iIJotxsJBp3Ea5YsjCTfA8WNfhwC3yha8zoYE7nmSmdub_M8nNeevnpRmiA1lePKb6n4ncMR__9bDDCskCHOq1a_J4N80FviARH-DhnShh90tfw8e_wdfp2o-z7h4Ah7DPLuS-RwuHmHf-dTufzz1kL-PNTKFRY6rWE2H_lV_IvP7vUj02r3ZShamwb-YYvVLCHHMjgWkFBNHHEqVYSOmVuqJdTtt3X5J3jPS8zYtqxeKE3kBnmtp_uA23yM"
/// refresh_token : "def50200dee24af2102b80a89fce804a6b58a4c5310564c3d68b4b7b84cbc0f25265d0e316732614f8cd7e1af597367b3d6f152aefa38515563109b9c00ed5d13560a7f0e0f0993b72d58d5bda9527f336879d23186da0f9e5be451fcc3653f1471f5d03b04a39157933c2cbfeccc9102e43a88a6f42e35793848be459951dfe2b4c4a00ec87b1e54b11a830cf1770bec710c7c82d2f731298dee3b3a0638249cdfd2c54adbcb655e9a8f4702e2a7583adacf77f7b32c1bc8841e46f31286324daea8c803d36923f39a0cf50b8229432e41500af95257c278d89884c48d496899b646a4723b76c6f6570acf3eac89d4b3b4db7ea40a42b23507b3c17f8d80fe31c75f093e81f2713d11eabaf9764612a6eb85922dfc946b0c4f9b9fec2eec172e9e482f1ab8fcba11a6e6ae06fc7fb035ce062568d54976278ff2a13c3d00a01012268a7ac8fc2fd32ec4c0a7a6858380ef4147beb86761a5cfc51d149ab6fbf5aa4"

class AuthInfo {
  AuthInfo({
      String? tokenType, 
      int? expiresIn, 
      String? accessToken, 
      String? refreshToken,}){
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  AuthInfo.fromJson(dynamic json) {
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _tokenType;
  int? _expiresIn;
  String? _accessToken;
  String? _refreshToken;
AuthInfo copyWith({  String? tokenType,
  int? expiresIn,
  String? accessToken,
  String? refreshToken,
}) => AuthInfo(  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}