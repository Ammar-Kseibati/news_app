import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String status;
  final String code;
  final String message;

  const ErrorMessageModel(
      {required this.status, required this.code, required this.message});

  factory ErrorMessageModel.formJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      status: json["status"],
      code: json["code"],
      message: json["message"],
    );
  }

  @override
  List<Object?> get props => [status, code, message];
}
