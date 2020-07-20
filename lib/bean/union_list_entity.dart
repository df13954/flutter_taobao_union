import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionListEntity with JsonConvert<UnionListEntity> {
	bool success;
	int code;
	String message;
	List<UnionListData> data;
}

class UnionListData with JsonConvert<UnionListData> {
	int type;
	@JSONField(name: "favorites_id")
	int favoritesId;
	@JSONField(name: "favorites_title")
	String favoritesTitle;
}
