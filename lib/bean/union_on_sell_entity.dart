import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionOnSellEntity with JsonConvert<UnionOnSellEntity> {
	bool success;
	int code;
	String message;
	UnionOnSellData data;
}

class UnionOnSellData with JsonConvert<UnionOnSellData> {
	@JSONField(name: "tbk_dg_optimus_material_response")
	UnionOnSellDataTbkDgOptimusMaterialResponse tbkDgOptimusMaterialResponse;
}

class UnionOnSellDataTbkDgOptimusMaterialResponse with JsonConvert<UnionOnSellDataTbkDgOptimusMaterialResponse> {
	@JSONField(name: "is_default")
	String isDefault;
	@JSONField(name: "result_list")
	UnionOnSellDataTbkDgOptimusMaterialResponseResultList resultList;
	@JSONField(name: "request_id")
	String requestId;
}

class UnionOnSellDataTbkDgOptimusMaterialResponseResultList with JsonConvert<UnionOnSellDataTbkDgOptimusMaterialResponseResultList> {
	@JSONField(name: "map_data")
	List<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData> mapData;
}

class UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData with JsonConvert<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData> {
	@JSONField(name: "category_id")
	int categoryId;
	@JSONField(name: "category_name")
	String categoryName;
	@JSONField(name: "click_url")
	String clickUrl;
	@JSONField(name: "commission_rate")
	String commissionRate;
	@JSONField(name: "coupon_amount")
	int couponAmount;
	@JSONField(name: "coupon_click_url")
	String couponClickUrl;
	@JSONField(name: "coupon_end_time")
	String couponEndTime;
	@JSONField(name: "coupon_info")
	String couponInfo;
	@JSONField(name: "coupon_remain_count")
	int couponRemainCount;
	@JSONField(name: "coupon_share_url")
	String couponShareUrl;
	@JSONField(name: "coupon_start_fee")
	String couponStartFee;
	@JSONField(name: "coupon_start_time")
	String couponStartTime;
	@JSONField(name: "coupon_total_count")
	int couponTotalCount;
	@JSONField(name: "item_description")
	String itemDescription;
	@JSONField(name: "item_id")
	int itemId;
	@JSONField(name: "level_one_category_id")
	int levelOneCategoryId;
	@JSONField(name: "level_one_category_name")
	String levelOneCategoryName;
	String nick;
	@JSONField(name: "pict_url")
	String pictUrl;
	@JSONField(name: "seller_id")
	int sellerId;
	@JSONField(name: "shop_title")
	String shopTitle;
	@JSONField(name: "small_images")
	UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages smallImages;
	String title;
	@JSONField(name: "user_type")
	int userType;
	int volume;
	@JSONField(name: "zk_final_price")
	String zkFinalPrice;
}

class UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages with JsonConvert<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages> {
	List<String> string;
}
