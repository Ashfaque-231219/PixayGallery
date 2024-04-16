class LoginModelData {
  String? userToken;
  String? id;
  String? name;
  String? mobile;
  String? email;

  LoginModelData({
    this.userToken,
    this.id,
    this.name,
    this.mobile,
    this.email,
  });

  LoginModelData.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token']?.toString();
    id = json['id']?.toString();
    name = json['name']?.toString();
    mobile = json['mobile']?.toString();
    email = json['email']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_token'] = userToken;
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}

class LoginModel {
  String? title;
  String? message;
  LoginModelData? data;

  LoginModel({
    this.title,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    message = json['message']?.toString();
    data =
        (json['data'] != null) ? LoginModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
