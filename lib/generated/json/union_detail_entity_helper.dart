import 'package:flutterapp/bean/union_detail_entity.dart';

unionDetailEntityFromJson(UnionDetailEntity data, Map<String, dynamic> json) {
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
		data.data = new UnionDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> unionDetailEntityToJson(UnionDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

unionDetailDataFromJson(UnionDetailData data, Map<String, dynamic> json) {
	if (json['tbk_uatm_favorites_item_get_response'] != null) {
		data.tbkUatmFavoritesItemGetResponse = new UnionDetailDataTbkUatmFavoritesItemGetResponse().fromJson(json['tbk_uatm_favorites_item_get_response']);
	}
	return data;
}

Map<String, dynamic> unionDetailDataToJson(UnionDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.tbkUatmFavoritesItemGetResponse != null) {
		data['tbk_uatm_favorites_item_get_response'] = entity.tbkUatmFavoritesItemGetResponse.toJson();
	}
	return data;
}

unionDetailDataTbkUatmFavoritesItemGetResponseFromJson(UnionDetailDataTbkUatmFavoritesItemGetResponse data, Map<String, dynamic> json) {
	if (json['results'] != null) {
		data.results = new UnionDetailDataTbkUatmFavoritesItemGetResponseResults().fromJson(json['results']);
	}
	if (json['total_results'] != null) {
		data.totalResults = json['total_results']?.toInt();
	}
	if (json['request_id'] != null) {
		data.requestId = json['request_id']?.toString();
	}
	return data;
}

Map<String, dynamic> unionDetailDataTbkUatmFavoritesItemGetResponseToJson(UnionDetailDataTbkUatmFavoritesItemGetResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.results != null) {
		data['results'] = entity.results.toJson();
	}
	data['total_results'] = entity.totalResults;
	data['request_id'] = entity.requestId;
	return data;
}

unionDetailDataTbkUatmFavoritesItemGetResponseResultsFromJson(UnionDetailDataTbkUatmFavoritesItemGetResponseResults data, Map<String, dynamic> json) {
	if (json['favoriteId'] != null) {
		data.favoriteId = json['favoriteId']?.toInt();
	}
	if (json['uatm_tbk_item'] != null) {
		data.uatmTbkItem = new List<UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem>();
		(json['uatm_tbk_item'] as List).forEach((v) {
			data.uatmTbkItem.add(new UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionDetailDataTbkUatmFavoritesItemGetResponseResultsToJson(UnionDetailDataTbkUatmFavoritesItemGetResponseResults entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['favoriteId'] = entity.favoriteId;
	if (entity.uatmTbkItem != null) {
		data['uatm_tbk_item'] =  entity.uatmTbkItem.map((v) => v.toJson()).toList();
	}
	return data;
}

unionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItemFromJson(UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem data, Map<String, dynamic> json) {
	if (json['click_url'] != null) {
		data.clickUrl = json['click_url']?.toString();
	}
	if (json['coupon_click_url'] != null) {
		data.couponClickUrl = json['coupon_click_url']?.toString();
	}
	if (json['coupon_end_time'] != null) {
		data.couponEndTime = json['coupon_end_time']?.toString();
	}
	if (json['coupon_info'] != null) {
		data.couponInfo = json['coupon_info']?.toString();
	}
	if (json['coupon_remain_count'] != null) {
		data.couponRemainCount = json['coupon_remain_count']?.toInt();
	}
	if (json['coupon_start_time'] != null) {
		data.couponStartTime = json['coupon_start_time']?.toString();
	}
	if (json['coupon_total_count'] != null) {
		data.couponTotalCount = json['coupon_total_count']?.toInt();
	}
	if (json['event_end_time'] != null) {
		data.eventEndTime = json['event_end_time']?.toString();
	}
	if (json['event_start_time'] != null) {
		data.eventStartTime = json['event_start_time']?.toString();
	}
	if (json['item_url'] != null) {
		data.itemUrl = json['item_url']?.toString();
	}
	if (json['num_iid'] != null) {
		data.numIid = json['num_iid']?.toInt();
	}
	if (json['pict_url'] != null) {
		data.pictUrl = json['pict_url']?.toString();
	}
	if (json['reserve_price'] != null) {
		data.reservePrice = json['reserve_price']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['tk_rate'] != null) {
		data.tkRate = json['tk_rate']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['user_type'] != null) {
		data.userType = json['user_type']?.toInt();
	}
	if (json['volume'] != null) {
		data.volume = json['volume']?.toInt();
	}
	if (json['zk_final_price'] != null) {
		data.zkFinalPrice = json['zk_final_price']?.toString();
	}
	if (json['zk_final_price_wap'] != null) {
		data.zkFinalPriceWap = json['zk_final_price_wap']?.toString();
	}
	return data;
}

Map<String, dynamic> unionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItemToJson(UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['click_url'] = entity.clickUrl;
	data['coupon_click_url'] = entity.couponClickUrl;
	data['coupon_end_time'] = entity.couponEndTime;
	data['coupon_info'] = entity.couponInfo;
	data['coupon_remain_count'] = entity.couponRemainCount;
	data['coupon_start_time'] = entity.couponStartTime;
	data['coupon_total_count'] = entity.couponTotalCount;
	data['event_end_time'] = entity.eventEndTime;
	data['event_start_time'] = entity.eventStartTime;
	data['item_url'] = entity.itemUrl;
	data['num_iid'] = entity.numIid;
	data['pict_url'] = entity.pictUrl;
	data['reserve_price'] = entity.reservePrice;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['tk_rate'] = entity.tkRate;
	data['type'] = entity.type;
	data['user_type'] = entity.userType;
	data['volume'] = entity.volume;
	data['zk_final_price'] = entity.zkFinalPrice;
	data['zk_final_price_wap'] = entity.zkFinalPriceWap;
	return data;
}