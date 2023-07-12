class ActiveShareResponse {
  late final ActiveSharing activeSharing;

  ActiveShareResponse.fromJson(Map<String, dynamic> json) {
    if (json['activeSharing'] != null) {
      activeSharing = ActiveSharing.fromJson(json['activeSharing']);
      print(activeSharing);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['activeSharing'] = activeSharing.toJson();
    return _data;
  }
}

class ActiveSharing {
  ActiveSharing({
    required this.userId,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  late final int userId;
  late final String type;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  ActiveSharing.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['type'] = type;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
