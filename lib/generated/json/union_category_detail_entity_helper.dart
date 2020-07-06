import 'package:flutterapp/bean/union_category_detail_entity.dart';

unionCategoryDetailEntityFromJson(UnionCategoryDetailEntity data, Map<String, dynamic> json) {
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
		data.data = new List<UnionCategoryDetailData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new UnionCategoryDetailData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> unionCategoryDetailEntityToJson(UnionCategoryDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

unionCategoryDetailDataFromJson(UnionCategoryDetailData data, Map<String, dynamic> json) {
	if (json['category_id'] != null) {
		data.categoryId = json['category_id']?.toInt();
	}
	if (json['category_name'] != null) {
		data.categoryName = json['category_name'];
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
		data.couponInfo = json['coupon_info'];
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
		data.smallImages = new UnionCategoryDetailDataSmallImages().fromJson(json['small_images']);
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

Map<String, dynamic> unionCategoryDetailDataToJson(UnionCategoryDetailData entity) {
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

unionCategoryDetailDataSmallImagesFromJson(UnionCategoryDetailDataSmallImages data, Map<String, dynamic> json) {
	if (json['string'] != null) {
		data.string = json['string']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> unionCategoryDetailDataSmallImagesToJson(UnionCategoryDetailDataSmallImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['string'] = entity.string;
	return data;
}