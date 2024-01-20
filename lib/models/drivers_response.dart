class DriversListResponse {
  List<Drivers>? _drivers;
  bool? _status;

  DriversListResponse({List<Drivers>? drivers, bool? status}) {
    if (drivers != null) {
      _drivers = drivers;
    }
    if (status != null) {
      _status = status;
    }
  }

  List<Drivers>? get drivers => _drivers;
  set drivers(List<Drivers>? drivers) => _drivers = drivers;
  bool? get status => _status;
  set status(bool? status) => _status = status;

  DriversListResponse.fromJson(Map<String, dynamic> json) {
    if (json['drivers'] != null) {
      _drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        _drivers!.add(Drivers.fromJson(v));
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_drivers != null) {
      data['drivers'] = _drivers!.map((v) => v.toJson()).toList();
    }
    data['status'] = _status;
    return data;
  }
}

class Drivers {
  int? _id;
  String? _name;
  String? _mobile;
  String? _licenseNo;

  Drivers({int? id, String? name, String? mobile, String? licenseNo}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (mobile != null) {
      _mobile = mobile;
    }
    if (licenseNo != null) {
      _licenseNo = licenseNo;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get licenseNo => _licenseNo;
  set licenseNo(String? licenseNo) => _licenseNo = licenseNo;

  Drivers.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _licenseNo = json['license_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['mobile'] = _mobile;
    data['license_no'] = _licenseNo;
    return data;
  }
}
