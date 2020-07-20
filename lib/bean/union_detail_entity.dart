import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class UnionDetailEntity with JsonConvert<UnionDetailEntity> {
	bool success;
	int code;
	String message;
	UnionDetailData data;
}

class UnionDetailData with JsonConvert<UnionDetailData> {
	@JSONField(name: "tbk_uatm_favorites_item_get_response")
	UnionDetailDataTbkUatmFavoritesItemGetResponse tbkUatmFavoritesItemGetResponse;
}

class UnionDetailDataTbkUatmFavoritesItemGetResponse with JsonConvert<UnionDetailDataTbkUatmFavoritesItemGetResponse> {
	UnionDetailDataTbkUatmFavoritesItemGetResponseResults results;
	@JSONField(name: "total_results")
	int totalResults;
	@JSONField(name: "request_id")
	String requestId;
}

class UnionDetailDataTbkUatmFavoritesItemGetResponseResults with JsonConvert<UnionDetailDataTbkUatmFavoritesItemGetResponseResults> {
	int favoriteId;
	@JSONField(name: "uatm_tbk_item")
	List<UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem> uatmTbkItem;
}

class UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem with JsonConvert<UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem> {
	@JSONField(name: "click_url")
	String clickUrl;
	@JSONField(name: "coupon_click_url")
	String couponClickUrl;
	@JSONField(name: "coupon_end_time")
	String couponEndTime;
	@JSONField(name: "coupon_info")
	String couponInfo;
	@JSONField(name: "coupon_remain_count")
	int couponRemainCount;
	@JSONField(name: "coupon_start_time")
	String couponStartTime;
	@JSONField(name: "coupon_total_count")
	int couponTotalCount;
	@JSONField(name: "event_end_time")
	String eventEndTime;
	@JSONField(name: "event_start_time")
	String eventStartTime;
	@JSONField(name: "item_url")
	String itemUrl;
	@JSONField(name: "num_iid")
	int numIid;
	@JSONField(name: "pict_url")
	String pictUrl;
	@JSONField(name: "reserve_price")
	String reservePrice;
	int status;
	String title;
	@JSONField(name: "tk_rate")
	String tkRate;
	int type;
	@JSONField(name: "user_type")
	int userType;
	int volume;
	@JSONField(name: "zk_final_price")
	String zkFinalPrice;
	@JSONField(name: "zk_final_price_wap")
	String zkFinalPriceWap;
}
