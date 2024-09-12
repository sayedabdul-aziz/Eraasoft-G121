import 'data.dart';

class RegisterResponseModel {
  UserData? data;
  String? message;
  List<dynamic>? error;
  int? status;

  RegisterResponseModel({this.data, this.message, this.error, this.status});
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}
