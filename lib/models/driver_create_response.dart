class DriverCreateResponse {
  String? _message;
  bool? _status;

  DriverCreateResponse({String? message, bool? status}) {
    if (message != null) {
      _message = message;
    }
    if (status != null) {
      _status = status;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  bool? get status => _status;
  set status(bool? status) => _status = status;

  DriverCreateResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _message;
    data['status'] = _status;
    return data;
  }
}
