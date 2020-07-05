import 'package:flutterapp/bean/union_categories_entity.dart';

unionCategoriesEntityFromJson(UnionCategoriesEntity data, Map<String, dynamic> json) {
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
		data.data = new List<UnionCategoriesData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new UnionCategoriesData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionCategoriesEntityToJson(UnionCategoriesEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

unionCategoriesDataFromJson(UnionCategoriesData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> unionCategoriesDataToJson(UnionCategoriesData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	return data;
}