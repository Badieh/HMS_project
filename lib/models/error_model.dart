class ErrorModel {
  final int? statusCode;
  final String message;
  final String? stack;

  ErrorModel({this.statusCode, required this.message, this.stack});

  factory ErrorModel.fromJson({required Map<String, dynamic> json}) {
    return ErrorModel(
        statusCode: json['statusCode'],
        message: json['message'],
        stack: json['stack']);
  }
}
