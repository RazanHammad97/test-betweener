class UserLinkModel {
  UserLinkModel({
    required this.id,
    required this.title,
    required this.link,
    required this.username,
    required this.isActive,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String title;
  late final String link;
  late final String username;
  late final int isActive;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  UserLinkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['link'] = link;
    _data['username'] = username;
    _data['isActive'] = isActive;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
