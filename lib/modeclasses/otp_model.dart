class UserData {
  final String authToken;
  final String name;
  final String mobile;

  UserData({
    required this.authToken,
    required this.name,
    required this.mobile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      authToken: json['data']['auth_token'] ?? '',
      name: json['data']['name'] ?? '',
      mobile: json['data']['mobile'] ?? '',
    );
  }
}

class ApiResponse {
  final UserData? data;
  final Map<String, dynamic> error;
  final String uiMessage;
  final String developerMessage;
  final int status;

  ApiResponse({
    required this.data,
    required this.error,
    required this.uiMessage,
    required this.developerMessage,
    required this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['data'] != null ? UserData.fromJson(json) : null,
      error: json['error'] ?? {},
      uiMessage: json['ui_message'] ?? '',
      developerMessage: json['developer_message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}
