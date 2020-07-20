import 'package:flutterapp/bean/union_list_entity.dart';

unionListEntityFromJson(UnionListEntity data, Map<String, dynamic> json) {
	if (json['success'] != null) {
		data.success = json['success'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<UnionListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new UnionListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionListEntityToJson(UnionListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

unionListDataFromJson(UnionListData data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['favorites_id'] != null) {
		data.favoritesId = json['favorites_id']?.toInt();
	}
	if (json['favorites_title'] != null) {
		data.favoritesTitle = json['favorites_title']?.toString();
	}
	return data;
}

Map<String, dynamic> unionListDataToJson(UnionListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['favorites_id'] = entity.favoritesId;
	data['favorites_title'] = entity.favoritesTitle;
	return data;
}