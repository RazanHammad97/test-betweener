class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.fcm,
  });
  late final int id;
  late final String? name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;
  late final int isActive;
  late final String? country;
  late final Null ip;
  late final double? long;
  late final double? lat;
  late final String? fcm;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = null;
    long = json['long'];
    lat = json['lat'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['isActive'] = isActive;
    _data['country'] = country;
    _data['ip'] = ip;
    _data['long'] = long;
    _data['lat'] = lat;
    _data['fcm'] = fcm;
    return _data;
  }
}
