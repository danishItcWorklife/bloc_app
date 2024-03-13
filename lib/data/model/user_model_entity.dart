import 'package:bloc_app/generated/json/base/json_field.dart';
import 'package:bloc_app/generated/json/user_model_entity.g.dart';
import 'dart:convert';
export 'package:bloc_app/generated/json/user_model_entity.g.dart';

@JsonSerializable()
class UserModelEntity {
	int? page = 0;
	@JSONField(name: "per_page")
	int? perPage = 0;
	int? total = 0;
	@JSONField(name: "total_pages")
	int? totalPages = 0;
	List<UserModelData>? data = [];
	UserModelSupport? support;

	UserModelEntity();

	factory UserModelEntity.fromJson(Map<String, dynamic> json) => $UserModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserModelData {
	int? id = 0;
	String? email = '';
	@JSONField(name: "first_name")
	String? firstName = '';
	@JSONField(name: "last_name")
	String? lastName = '';
	String? avatar = '';

	UserModelData();

	factory UserModelData.fromJson(Map<String, dynamic> json) => $UserModelDataFromJson(json);

	Map<String, dynamic> toJson() => $UserModelDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserModelSupport {
	String? url = '';
	String? text = '';

	UserModelSupport();

	factory UserModelSupport.fromJson(Map<String, dynamic> json) => $UserModelSupportFromJson(json);

	Map<String, dynamic> toJson() => $UserModelSupportToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}