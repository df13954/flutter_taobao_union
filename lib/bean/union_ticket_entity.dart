import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionTicketEntity with JsonConvert<UnionTicketEntity> {
	bool success;
	int code;
	String message;
	UnionTicketData data;
}

class UnionTicketData with JsonConvert<UnionTicketData> {
	@JSONField(name: "tbk_tpwd_create_response")
	UnionTicketDataTbkTpwdCreateResponse tbkTpwdCreateResponse;
}

class UnionTicketDataTbkTpwdCreateResponse with JsonConvert<UnionTicketDataTbkTpwdCreateResponse> {
	UnionTicketDataTbkTpwdCreateResponseData data;
	@JSONField(name: "request_id")
	String requestId;
}

class UnionTicketDataTbkTpwdCreateResponseData with JsonConvert<UnionTicketDataTbkTpwdCreateResponseData> {
	String model;
}
