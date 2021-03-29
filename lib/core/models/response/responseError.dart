class ResponseError {
  final String code;
  final String description;

  ResponseError({this.code, this.description});

  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(
        code:json['code'],
        description:json['description']
    );
  }
}
