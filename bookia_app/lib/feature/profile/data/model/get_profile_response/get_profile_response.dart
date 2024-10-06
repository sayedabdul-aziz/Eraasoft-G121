import 'package:bookia_app/feature/auth/data/models/response/login_response_model/user.dart';

class GetProfileResponse {
  UserModel? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GetProfileResponse({this.data, this.message, this.error, this.status});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}
