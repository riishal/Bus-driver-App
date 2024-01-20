class BusListResponse {
  List<Bus>? _bus;
  bool? _status;

  BusListResponse({List<Bus>? bus, bool? status}) {
    if (bus != null) {
      _bus = bus;
    }
    if (status != null) {
      _status = status;
    }
  }

  List<Bus>? get bus => _bus;
  set bus(List<Bus>? bus) => _bus = bus;
  bool? get status => _status;
  set status(bool? status) => _status = status;

  BusListResponse.fromJson(Map<String, dynamic> json) {
    if (json['bus'] != null) {
      _bus = <Bus>[];
      json['bus'].forEach((v) {
        _bus!.add(Bus.fromJson(v));
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_bus != null) {
      data['bus'] = _bus!.map((v) => v.toJson()).toList();
    }
    data['status'] = _status;
    return data;
  }
}

class Bus {
  int? _id;
  String? _image;
  String? _name;
  String? _type;
  String? _driverName;
  String? _driverLicenseNo;

  Bus(
      {int? id,
      String? image,
      String? name,
      String? type,
      String? driverName,
      String? driverLicenseNo}) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (name != null) {
      _name = name;
    }
    if (type != null) {
      _type = type;
    }
    if (driverName != null) {
      _driverName = driverName;
    }
    if (driverLicenseNo != null) {
      _driverLicenseNo = driverLicenseNo;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get driverName => _driverName;
  set driverName(String? driverName) => _driverName = driverName;
  String? get driverLicenseNo => _driverLicenseNo;
  set driverLicenseNo(String? driverLicenseNo) =>
      _driverLicenseNo = driverLicenseNo;

  Bus.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _type = json['type'];
    _driverName = json['driver_name'];
    _driverLicenseNo = json['driver_license_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['image'] = _image;
    data['name'] = _name;
    data['type'] = _type;
    data['driver_name'] = _driverName;
    data['driver_license_no'] = _driverLicenseNo;
    return data;
  }
}
