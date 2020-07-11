import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionSearchEntity with JsonConvert<UnionSearchEntity> {
	bool success;
	int code;
	String message;
	UnionSearchData data;
}

class UnionSearchData with JsonConvert<UnionSearchData> {
	@JSONField(name: "tbk_dg_material_optional_response")
	UnionSearchDataTbkDgMaterialOptionalResponse tbkDgMaterialOptionalResponse;
}

class UnionSearchDataTbkDgMaterialOptionalResponse with JsonConvert<UnionSearchDataTbkDgMaterialOptionalResponse> {
	@JSONField(name: "result_list")
	UnionSearchDataTbkDgMaterialOptionalResponseResultList resultList;
	@JSONField(name: "total_results")
	int totalResults;
	@JSONField(name: "request_id")
	String requestId;
}

class UnionSearchDataTbkDgMaterialOptionalResponseResultList with JsonConvert<UnionSearchDataTbkDgMaterialOptionalResponseResultList> {
	@JSONField(name: "map_data")
	List<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData> mapData;
}

class UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData with JsonConvert<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData> {
	@JSONField(name: "category_id")
	int categoryId;
	@JSONField(name: "category_name")
	String categoryName;
	@JSONField(name: "commission_rate")
	String commissionRate;
	@JSONField(name: "commission_type")
	String commissionType;
	@JSONField(name: "coupon_amount")
	String couponAmount;
	@JSONField(name: "coupon_end_time")
	String couponEndTime;
	@JSONField(name: "coupon_id")
	String couponId;
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
	@JSONField(name: "include_dxjh")
	String includeDxjh;
	@JSONField(name: "include_mkt")
	String includeMkt;
	@JSONField(name: "info_dxjh")
	String infoDxjh;
	@JSONField(name: "item_description")
	String itemDescription;
	@JSONField(name: "item_id")
	int itemId;
	@JSONField(name: "item_url")
	String itemUrl;
	@JSONField(name: "level_one_category_id")
	int levelOneCategoryId;
	@JSONField(name: "level_one_category_name")
	String levelOneCategoryName;
	String nick;
	@JSONField(name: "num_iid")
	int numIid;
	@JSONField(name: "pict_url")
	String pictUrl;
	@JSONField(name: "presale_deposit")
	dynamic presaleDeposit;
	@JSONField(name: "presale_end_time")
	int presaleEndTime;
	@JSONField(name: "presale_start_time")
	int presaleStartTime;
	@JSONField(name: "presale_tail_end_time")
	int presaleTailEndTime;
	@JSONField(name: "presale_tail_start_time")
	int presaleTailStartTime;
	String provcity;
	@JSONField(name: "real_post_fee")
	String realPostFee;
	@JSONField(name: "reserve_price")
	String reservePrice;
	@JSONField(name: "seller_id")
	int sellerId;
	@JSONField(name: "shop_dsr")
	int shopDsr;
	@JSONField(name: "shop_title")
	String shopTitle;
	@JSONField(name: "short_title")
	String shortTitle;
	@JSONField(name: "small_images")
	UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages smallImages;
	String title;
	@JSONField(name: "tk_total_commi")
	String tkTotalCommi;
	@JSONField(name: "tk_total_sales")
	String tkTotalSales;
	String url;
	@JSONField(name: "user_type")
	int userType;
	int volume;
	@JSONField(name: "white_image")
	String whiteImage;
	@JSONField(name: "x_id")
	String xId;
	@JSONField(name: "zk_final_price")
	String zkFinalPrice;
	@JSONField(name: "jdd_num")
	int jddNum;
	@JSONField(name: "jdd_price")
	dynamic jddPrice;
	dynamic oetime;
	dynamic ostime;
}

class UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages with JsonConvert<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages> {
	List<String> string;
}
