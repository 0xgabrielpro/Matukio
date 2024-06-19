class CouponModel {
  bool? success;
  dynamic msg;
  List<CouponData>? data;

  CouponModel({this.success, this.msg, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CouponData>[];
      json['data'].forEach((v) {
        data!.add(CouponData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponData {
  int? id;
  int? userId;
  int? eventId;
  String? couponCode;
  String? name;
  num? discount;
  int? minimumAmount;
  int? maximumDiscount;
  String? description;
  String? startDate;
  String? endDate;
  int? maxUse;
  int? useCount;
  int? status;
  String? createdAt;
  String? updatedAt;

  CouponData(
      {this.id,
      this.userId,
      this.eventId,
      this.couponCode,
      this.name,
      this.discount,
      this.minimumAmount,
      this.maximumDiscount,
      this.description,
      this.startDate,
      this.endDate,
      this.maxUse,
      this.useCount,
      this.status,
      this.createdAt,
      this.updatedAt});

  CouponData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    couponCode = json['coupon_code'];
    name = json['name'];
    discount = num.parse(json['discount'].toString());
    minimumAmount = json['minimum_amount'];
    maximumDiscount = json['maximum_discount'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    maxUse = json['max_use'];
    useCount = json['use_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['coupon_code'] = couponCode;
    data['name'] = name;
    data['discount'] = discount;
    data['minimum_amount'] = minimumAmount;
    data['maximum_discount'] = maximumDiscount;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['max_use'] = maxUse;
    data['use_count'] = useCount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
