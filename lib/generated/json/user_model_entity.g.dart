import 'package:bloc_app/generated/json/base/json_convert_content.dart';
import 'package:bloc_app/data/model/user_model_entity.dart';

UserModelEntity $UserModelEntityFromJson(Map<String, dynamic> json) {
  final UserModelEntity userModelEntity = UserModelEntity();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    userModelEntity.page = page;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    userModelEntity.perPage = perPage;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    userModelEntity.total = total;
  }
  final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
  if (totalPages != null) {
    userModelEntity.totalPages = totalPages;
  }
  final List<UserModelData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<UserModelData>(e) as UserModelData)
      .toList();
  if (data != null) {
    userModelEntity.data = data;
  }
  final UserModelSupport? support = jsonConvert.convert<UserModelSupport>(
      json['support']);
  if (support != null) {
    userModelEntity.support = support;
  }
  return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['per_page'] = entity.perPage;
  data['total'] = entity.total;
  data['total_pages'] = entity.totalPages;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['support'] = entity.support?.toJson();
  return data;
}

extension UserModelEntityExtension on UserModelEntity {
  UserModelEntity copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserModelData>? data,
    UserModelSupport? support,
  }) {
    return UserModelEntity()
      ..page = page ?? this.page
      ..perPage = perPage ?? this.perPage
      ..total = total ?? this.total
      ..totalPages = totalPages ?? this.totalPages
      ..data = data ?? this.data
      ..support = support ?? this.support;
  }
}

UserModelData $UserModelDataFromJson(Map<String, dynamic> json) {
  final UserModelData userModelData = UserModelData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userModelData.id = id;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userModelData.email = email;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    userModelData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    userModelData.lastName = lastName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userModelData.avatar = avatar;
  }
  return userModelData;
}

Map<String, dynamic> $UserModelDataToJson(UserModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['email'] = entity.email;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['avatar'] = entity.avatar;
  return data;
}

extension UserModelDataExtension on UserModelData {
  UserModelData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserModelData()
      ..id = id ?? this.id
      ..email = email ?? this.email
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..avatar = avatar ?? this.avatar;
  }
}

UserModelSupport $UserModelSupportFromJson(Map<String, dynamic> json) {
  final UserModelSupport userModelSupport = UserModelSupport();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    userModelSupport.url = url;
  }
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    userModelSupport.text = text;
  }
  return userModelSupport;
}

Map<String, dynamic> $UserModelSupportToJson(UserModelSupport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['text'] = entity.text;
  return data;
}

extension UserModelSupportExtension on UserModelSupport {
  UserModelSupport copyWith({
    String? url,
    String? text,
  }) {
    return UserModelSupport()
      ..url = url ?? this.url
      ..text = text ?? this.text;
  }
}