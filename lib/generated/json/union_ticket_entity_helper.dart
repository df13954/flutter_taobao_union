import 'package:flutterapp/bean/union_ticket_entity.dart';

unionTicketEntityFromJson(UnionTicketEntity data, Map<String, dynamic> json) {
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
		data.data = new UnionTicketData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> unionTicketEntityToJson(UnionTicketEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

unionTicketDataFromJson(UnionTicketData data, Map<String, dynamic> json) {
	if (json['tbk_tpwd_create_response'] != null) {
		data.tbkTpwdCreateResponse = new UnionTicketDataTbkTpwdCreateResponse().fromJson(json['tbk_tpwd_create_response']);
	}
	return data;
}

Map<String, dynamic> unionTicketDataToJson(UnionTicketData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.tbkTpwdCreateResponse != null) {
		data['tbk_tpwd_create_response'] = entity.tbkTpwdCreateResponse.toJson();
	}
	return data;
}

unionTicketDataTbkTpwdCreateResponseFromJson(UnionTicketDataTbkTpwdCreateResponse data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new UnionTicketDataTbkTpwdCreateResponseData().fromJson(json['data']);
	}
	if (json['request_id'] != null) {
		data.requestId = json['request_id']?.toString();
	}
	return data;
}

Map<String, dynamic> unionTicketDataTbkTpwdCreateResponseToJson(UnionTicketDataTbkTpwdCreateResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['request_id'] = entity.requestId;
	return data;
}

unionTicketDataTbkTpwdCreateResponseDataFromJson(UnionTicketDataTbkTpwdCreateResponseData data, Map<String, dynamic> json) {
	if (json['model'] != null) {
		data.model = json['model']?.toString();
	}
	return data;
}

Map<String, dynamic> unionTicketDataTbkTpwdCreateResponseDataToJson(UnionTicketDataTbkTpwdCreateResponseData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['model'] = entity.model;
	return data;
}