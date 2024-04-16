class RegisterModel {
  final String title;
  final String message;
  final UserData data;

  RegisterModel({
    required this.title,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final String userToken;
  final int id;
  final String name;
  final String mobile;
  final String email;

  UserData({
    required this.userToken,
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userToken: json['user_token'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class ErrorResponse {
  final String title;
  final String message;

  ErrorResponse({
    required this.title,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      title: json['title'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
