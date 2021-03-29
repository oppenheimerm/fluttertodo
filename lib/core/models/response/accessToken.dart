class AccessToken {
  String token;
  String expiresIn;

  AccessToken({this.token, this.expiresIn});

  factory AccessToken.fromJson(Map<String, dynamic>json){
    return AccessToken(
        token: json['token'],
        expiresIn: json['expiresIn']
    );
  }
}