import 'package:flutterapp/generated/json/base/json_convert_content.dart';

class UnionCategoriesEntity with JsonConvert<UnionCategoriesEntity> {
	bool success;
	int code;
	String message;
	List<UnionCategoriesData> data;
}

class UnionCategoriesData with JsonConvert<UnionCategoriesData> {
	int id;
	String title;
}
