import 'package:flutterapp/bean/union_on_sell_entity.dart';

unionOnSellEntityFromJson(UnionOnSellEntity data, Map<String, dynamic> json) {
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
		data.data = new UnionOnSellData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> unionOnSellEntityToJson(UnionOnSellEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

unionOnSellDataFromJson(UnionOnSellData data, Map<String, dynamic> json) {
	if (json['tbk_dg_optimus_material_response'] != null) {
		data.tbkDgOptimusMaterialResponse = new UnionOnSellDataTbkDgOptimusMaterialResponse().fromJson(json['tbk_dg_optimus_material_response']);
	}
	return data;
}

Map<String, dynamic> unionOnSellDataToJson(UnionOnSellData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.tbkDgOptimusMaterialResponse != null) {
		data['tbk_dg_optimus_material_response'] = entity.tbkDgOptimusMaterialResponse.toJson();
	}
	return data;
}

unionOnSellDataTbkDgOptimusMaterialResponseFromJson(UnionOnSellDataTbkDgOptimusMaterialResponse data, Map<String, dynamic> json) {
	if (json['is_default'] != null) {
		data.isDefault = json['is_default']?.toString();
	}
	if (json['result_list'] != null) {
		data.resultList = new UnionOnSellDataTbkDgOptimusMaterialResponseResultList().fromJson(json['result_list']);
	}
	if (json['request_id'] != null) {
		data.requestId = json['request_id']?.toString();
	}
	return data;
}

Map<String, dynamic> unionOnSellDataTbkDgOptimusMaterialResponseToJson(UnionOnSellDataTbkDgOptimusMaterialResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['is_default'] = entity.isDefault;
	if (entity.resultList != null) {
		data['result_list'] = entity.resultList.toJson();
	}
	data['request_id'] = entity.requestId;
	return data;
}

unionOnSellDataTbkDgOptimusMaterialResponseResultListFromJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultList data, Map<String, dynamic> json) {
	if (json['map_data'] != null) {
		data.mapData = new List<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData>();
		(json['map_data'] as List).forEach((v) {
			data.mapData.add(new UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionOnSellDataTbkDgOptimusMaterialResponseResultListToJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.mapData != null) {
		data['map_data'] =  entity.mapData.map((v) => v.toJson()).toList();
	}
	return data;
}

unionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataFromJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData data, Map<String, dynamic> json) {
	if (json['category_id'] != null) {
		data.categoryId = json['category_id']?.toInt();
	}
	if (json['category_name'] != null) {
		data.categoryName = json['category_name']?.toString();
	}
	if (json['click_url'] != null) {
		data.clickUrl = json['click_url']?.toString();
	}
	if (json['commission_rate'] != null) {
		data.commissionRate = json['commission_rate']?.toString();
	}
	if (json['coupon_amount'] != null) {
		data.couponAmount = json['coupon_amount']?.toInt();
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
	if (json['coupon_share_url'] != null) {
		data.couponShareUrl = json['coupon_share_url']?.toString();
	}
	if (json['coupon_start_fee'] != null) {
		data.couponStartFee = json['coupon_start_fee']?.toString();
	}
	if (json['coupon_start_time'] != null) {
		data.couponStartTime = json['coupon_start_time']?.toString();
	}
	if (json['coupon_total_count'] != null) {
		data.couponTotalCount = json['coupon_total_count']?.toInt();
	}
	if (json['item_description'] != null) {
		data.itemDescription = json['item_description']?.toString();
	}
	if (json['item_id'] != null) {
		data.itemId = json['item_id']?.toInt();
	}
	if (json['level_one_category_id'] != null) {
		data.levelOneCategoryId = json['level_one_category_id']?.toInt();
	}
	if (json['level_one_category_name'] != null) {
		data.levelOneCategoryName = json['level_one_category_name']?.toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick']?.toString();
	}
	if (json['pict_url'] != null) {
		data.pictUrl = json['pict_url']?.toString();
	}
	if (json['seller_id'] != null) {
		data.sellerId = json['seller_id']?.toInt();
	}
	if (json['shop_title'] != null) {
		data.shopTitle = json['shop_title']?.toString();
	}
	if (json['small_images'] != null) {
		data.smallImages = new UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages().fromJson(json['small_images']);
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
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
	return data;
}

Map<String, dynamic> unionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataToJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['category_id'] = entity.categoryId;
	data['category_name'] = entity.categoryName;
	data['click_url'] = entity.clickUrl;
	data['commission_rate'] = entity.commissionRate;
	data['coupon_amount'] = entity.couponAmount;
	data['coupon_click_url'] = entity.couponClickUrl;
	data['coupon_end_time'] = entity.couponEndTime;
	data['coupon_info'] = entity.couponInfo;
	data['coupon_remain_count'] = entity.couponRemainCount;
	data['coupon_share_url'] = entity.couponShareUrl;
	data['coupon_start_fee'] = entity.couponStartFee;
	data['coupon_start_time'] = entity.couponStartTime;
	data['coupon_total_count'] = entity.couponTotalCount;
	data['item_description'] = entity.itemDescription;
	data['item_id'] = entity.itemId;
	data['level_one_category_id'] = entity.levelOneCategoryId;
	data['level_one_category_name'] = entity.levelOneCategoryName;
	data['nick'] = entity.nick;
	data['pict_url'] = entity.pictUrl;
	data['seller_id'] = entity.sellerId;
	data['shop_title'] = entity.shopTitle;
	if (entity.smallImages != null) {
		data['small_images'] = entity.smallImages.toJson();
	}
	data['title'] = entity.title;
	data['user_type'] = entity.userType;
	data['volume'] = entity.volume;
	data['zk_final_price'] = entity.zkFinalPrice;
	return data;
}

unionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImagesFromJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages data, Map<String, dynamic> json) {
	if (json['string'] != null) {
		data.string = json['string']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> unionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImagesToJson(UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapDataSmallImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['string'] = entity.string;
	return data;
}