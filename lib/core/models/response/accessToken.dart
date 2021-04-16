class AccessToken {
  String token;
  int expiresIn;

  AccessToken({this.token, this.expiresIn});

  factory AccessToken.fromJson(Map<String, dynamic>json){
    return AccessToken(
        token: json['token'],
        expiresIn: json['expiresIn']
    );
  }
  static AccessToken EmptyAccessToken(){
    return new AccessToken(token: "", expiresIn: 0);
  }
}