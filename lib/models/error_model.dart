class ErrorModel {
  final int statusCode;
  final String message;
  final String stack;

  ErrorModel(
      {required this.statusCode, required this.message, required this.stack});

  factory ErrorModel.fromJson({required Map<String, dynamic> json}) {
    return ErrorModel(
        statusCode: json['code'],
        message: json['message'],
        stack: json['stack']);
  }
}
