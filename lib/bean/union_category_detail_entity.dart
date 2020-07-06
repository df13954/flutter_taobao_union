import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionCategoryDetailEntity with JsonConvert<UnionCategoryDetailEntity> {
	bool success;
	int code;
	String message;
	List<UnionCategoryDetailData> data;
}

class UnionCategoryDetailData with JsonConvert<UnionCategoryDetailData> {
	@JSONField(name: "category_id")
	int categoryId;
	@JSONField(name: "category_name")
	dynamic categoryName;
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
	dynamic couponInfo;
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
	UnionCategoryDetailDataSmallImages smallImages;
	String title;
	@JSONField(name: "user_type")
	int userType;
	int volume;
	@JSONField(name: "zk_final_price")
	String zkFinalPrice;
}

class UnionCategoryDetailDataSmallImages with JsonConvert<UnionCategoryDetailDataSmallImages> {
	List<String> string;
}
