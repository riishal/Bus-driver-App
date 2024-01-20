class LoginResponse {
  bool? _status;
  bool? _user;
  String? _message;
  String? _accessToken;
  String? _refreshToken;

  LoginResponse(
      {bool? status,
      bool? user,
      String? message,
      String? accessToken,
      String? refreshToken}) {
    if (status != null) {
      _status = status;
    }
    if (user != null) {
      _user = user;
    }
    if (message != null) {
      _message = message;
    }
    if (accessToken != null) {
      _accessToken = accessToken;
    }
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  bool? get user => _user;
  set user(bool? user) => _user = user;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get refreshToken => _refreshToken;
  set refreshToken(String? refreshToken) => _refreshToken = refreshToken;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _user = json['user'];
    _message = json['message'];
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['user'] = _user;
    data['message'] = _message;
    data['access_token'] = _accessToken;
    data['refresh_token'] = _refreshToken;
    return data;
  }
}
