import 'package:flutterapp/bean/union_search_entity.dart';

unionSearchEntityFromJson(UnionSearchEntity data, Map<String, dynamic> json) {
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
		data.data = new UnionSearchData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> unionSearchEntityToJson(UnionSearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

unionSearchDataFromJson(UnionSearchData data, Map<String, dynamic> json) {
	if (json['tbk_dg_material_optional_response'] != null) {
		data.tbkDgMaterialOptionalResponse = new UnionSearchDataTbkDgMaterialOptionalResponse().fromJson(json['tbk_dg_material_optional_response']);
	}
	return data;
}

Map<String, dynamic> unionSearchDataToJson(UnionSearchData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.tbkDgMaterialOptionalResponse != null) {
		data['tbk_dg_material_optional_response'] = entity.tbkDgMaterialOptionalResponse.toJson();
	}
	return data;
}

unionSearchDataTbkDgMaterialOptionalResponseFromJson(UnionSearchDataTbkDgMaterialOptionalResponse data, Map<String, dynamic> json) {
	if (json['result_list'] != null) {
		data.resultList = new UnionSearchDataTbkDgMaterialOptionalResponseResultList().fromJson(json['result_list']);
	}
	if (json['total_results'] != null) {
		data.totalResults = json['total_results']?.toInt();
	}
	if (json['request_id'] != null) {
		data.requestId = json['request_id']?.toString();
	}
	return data;
}

Map<String, dynamic> unionSearchDataTbkDgMaterialOptionalResponseToJson(UnionSearchDataTbkDgMaterialOptionalResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.resultList != null) {
		data['result_list'] = entity.resultList.toJson();
	}
	data['total_results'] = entity.totalResults;
	data['request_id'] = entity.requestId;
	return data;
}

unionSearchDataTbkDgMaterialOptionalResponseResultListFromJson(UnionSearchDataTbkDgMaterialOptionalResponseResultList data, Map<String, dynamic> json) {
	if (json['map_data'] != null) {
		data.mapData = new List<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData>();
		(json['map_data'] as List).forEach((v) {
			data.mapData.add(new UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionSearchDataTbkDgMaterialOptionalResponseResultListToJson(UnionSearchDataTbkDgMaterialOptionalResponseResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.mapData != null) {
		data['map_data'] =  entity.mapData.map((v) => v.toJson()).toList();
	}
	return data;
}

unionSearchDataTbkDgMaterialOptionalResponseResultListMapDataFromJson(UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData data, Map<String, dynamic> json) {
	if (json['category_id'] != null) {
		data.categoryId = json['category_id']?.toInt();
	}
	if (json['category_name'] != null) {
		data.categoryName = json['category_name']?.toString();
	}
	if (json['commission_rate'] != null) {
		data.commissionRate = json['commission_rate']?.toString();
	}
	if (json['commission_type'] != null) {
		data.commissionType = json['commission_type']?.toString();
	}
	if (json['coupon_amount'] != null) {
		data.couponAmount = json['coupon_amount']?.toString();
	}
	if (json['coupon_end_time'] != null) {
		data.couponEndTime = json['coupon_end_time']?.toString();
	}
	if (json['coupon_id'] != null) {
		data.couponId = json['coupon_id']?.toString();
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
	if (json['include_dxjh'] != null) {
		data.includeDxjh = json['include_dxjh']?.toString();
	}
	if (json['include_mkt'] != null) {
		data.includeMkt = json['include_mkt']?.toString();
	}
	if (json['info_dxjh'] != null) {
		data.infoDxjh = json['info_dxjh']?.toString();
	}
	if (json['item_description'] != null) {
		data.itemDescription = json['item_description']?.toString();
	}
	if (json['item_id'] != null) {
		data.itemId = json['item_id']?.toInt();
	}
	if (json['item_url'] != null) {
		data.itemUrl = json['item_url']?.toString();
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
	if (json['num_iid'] != null) {
		data.numIid = json['num_iid']?.toInt();
	}
	if (json['pict_url'] != null) {
		data.pictUrl = json['pict_url']?.toString();
	}
	if (json['presale_deposit'] != null) {
		data.presaleDeposit = json['presale_deposit'];
	}
	if (json['presale_end_time'] != null) {
		data.presaleEndTime = json['presale_end_time']?.toInt();
	}
	if (json['presale_start_time'] != null) {
		data.presaleStartTime = json['presale_start_time']?.toInt();
	}
	if (json['presale_tail_end_time'] != null) {
		data.presaleTailEndTime = json['presale_tail_end_time']?.toInt();
	}
	if (json['presale_tail_start_time'] != null) {
		data.presaleTailStartTime = json['presale_tail_start_time']?.toInt();
	}
	if (json['provcity'] != null) {
		data.provcity = json['provcity']?.toString();
	}
	if (json['real_post_fee'] != null) {
		data.realPostFee = json['real_post_fee']?.toString();
	}
	if (json['reserve_price'] != null) {
		data.reservePrice = json['reserve_price']?.toString();
	}
	if (json['seller_id'] != null) {
		data.sellerId = json['seller_id']?.toInt();
	}
	if (json['shop_dsr'] != null) {
		data.shopDsr = json['shop_dsr']?.toInt();
	}
	if (json['shop_title'] != null) {
		data.shopTitle = json['shop_title']?.toString();
	}
	if (json['short_title'] != null) {
		data.shortTitle = json['short_title']?.toString();
	}
	if (json['small_images'] != null) {
		data.smallImages = new UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages().fromJson(json['small_images']);
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['tk_total_commi'] != null) {
		data.tkTotalCommi = json['tk_total_commi']?.toString();
	}
	if (json['tk_total_sales'] != null) {
		data.tkTotalSales = json['tk_total_sales']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['user_type'] != null) {
		data.userType = json['user_type']?.toInt();
	}
	if (json['volume'] != null) {
		data.volume = json['volume']?.toInt();
	}
	if (json['white_image'] != null) {
		data.whiteImage = json['white_image']?.toString();
	}
	if (json['x_id'] != null) {
		data.xId = json['x_id']?.toString();
	}
	if (json['zk_final_price'] != null) {
		data.zkFinalPrice = json['zk_final_price']?.toString();
	}
	if (json['jdd_num'] != null) {
		data.jddNum = json['jdd_num']?.toInt();
	}
	if (json['jdd_price'] != null) {
		data.jddPrice = json['jdd_price'];
	}
	if (json['oetime'] != null) {
		data.oetime = json['oetime'];
	}
	if (json['ostime'] != null) {
		data.ostime = json['ostime'];
	}
	return data;
}

Map<String, dynamic> unionSearchDataTbkDgMaterialOptionalResponseResultListMapDataToJson(UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['category_id'] = entity.categoryId;
	data['category_name'] = entity.categoryName;
	data['commission_rate'] = entity.commissionRate;
	data['commission_type'] = entity.commissionType;
	data['coupon_amount'] = entity.couponAmount;
	data['coupon_end_time'] = entity.couponEndTime;
	data['coupon_id'] = entity.couponId;
	data['coupon_info'] = entity.couponInfo;
	data['coupon_remain_count'] = entity.couponRemainCount;
	data['coupon_share_url'] = entity.couponShareUrl;
	data['coupon_start_fee'] = entity.couponStartFee;
	data['coupon_start_time'] = entity.couponStartTime;
	data['coupon_total_count'] = entity.couponTotalCount;
	data['include_dxjh'] = entity.includeDxjh;
	data['include_mkt'] = entity.includeMkt;
	data['info_dxjh'] = entity.infoDxjh;
	data['item_description'] = entity.itemDescription;
	data['item_id'] = entity.itemId;
	data['item_url'] = entity.itemUrl;
	data['level_one_category_id'] = entity.levelOneCategoryId;
	data['level_one_category_name'] = entity.levelOneCategoryName;
	data['nick'] = entity.nick;
	data['num_iid'] = entity.numIid;
	data['pict_url'] = entity.pictUrl;
	data['presale_deposit'] = entity.presaleDeposit;
	data['presale_end_time'] = entity.presaleEndTime;
	data['presale_start_time'] = entity.presaleStartTime;
	data['presale_tail_end_time'] = entity.presaleTailEndTime;
	data['presale_tail_start_time'] = entity.presaleTailStartTime;
	data['provcity'] = entity.provcity;
	data['real_post_fee'] = entity.realPostFee;
	data['reserve_price'] = entity.reservePrice;
	data['seller_id'] = entity.sellerId;
	data['shop_dsr'] = entity.shopDsr;
	data['shop_title'] = entity.shopTitle;
	data['short_title'] = entity.shortTitle;
	if (entity.smallImages != null) {
		data['small_images'] = entity.smallImages.toJson();
	}
	data['title'] = entity.title;
	data['tk_total_commi'] = entity.tkTotalCommi;
	data['tk_total_sales'] = entity.tkTotalSales;
	data['url'] = entity.url;
	data['user_type'] = entity.userType;
	data['volume'] = entity.volume;
	data['white_image'] = entity.whiteImage;
	data['x_id'] = entity.xId;
	data['zk_final_price'] = entity.zkFinalPrice;
	data['jdd_num'] = entity.jddNum;
	data['jdd_price'] = entity.jddPrice;
	data['oetime'] = entity.oetime;
	data['ostime'] = entity.ostime;
	return data;
}

unionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImagesFromJson(UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages data, Map<String, dynamic> json) {
	if (json['string'] != null) {
		data.string = json['string']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> unionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImagesToJson(UnionSearchDataTbkDgMaterialOptionalResponseResultListMapDataSmallImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['string'] = entity.string;
	return data;
}