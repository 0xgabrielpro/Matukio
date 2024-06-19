class BookOrderModel {
  BookOrderModel({
    bool? success,
    dynamic msg,
    Data? data,
  }) {
    _success = success;
    _msg = msg;
    _data = data;
  }

  BookOrderModel.fromJson(dynamic json) {
    _success = json['success'];
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  dynamic _msg;
  Data? _data;
  BookOrderModel copyWith({
    bool? success,
    dynamic msg,
    Data? data,
  }) =>
      BookOrderModel(
        success: success ?? _success,
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  bool? get success => _success;
  dynamic get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? eventId,
    String? ticketId,
    String? quantity,
    String? couponDiscount,
    String? payment,
    String? tax,
    String? paymentType,
    String? paymentToken,
    String? orderId,
    num? organizationId,
    num? customerId,
    num? paymentStatus,
    num? orgCommission,
    String? updatedAt,
    String? createdAt,
    num? id,
    dynamic review,
    String? bookSeats,
    String? seatDetails,
  }) {
    _eventId = eventId;
    _ticketId = ticketId;
    _quantity = quantity;
    _couponDiscount = couponDiscount;
    _payment = payment;
    _tax = tax;
    _paymentType = paymentType;
    _paymentToken = paymentToken;
    _orderId = orderId;
    _organizationId = organizationId;
    _customerId = customerId;
    _paymentStatus = paymentStatus;
    _orgCommission = orgCommission;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
    _review = review;
    _bookSeats = bookSeats;
    _seatDetails = seatDetails;
  }

  Data.fromJson(dynamic json) {
    _eventId = json['event_id'];
    _ticketId = json['ticket_id'];
    _quantity = json['quantity'];
    _couponDiscount = json['coupon_discount'];
    _payment = json['payment'];
    _tax = json['tax'];
    _paymentType = json['payment_type'];
    _paymentToken = json['payment_token'];
    _orderId = json['order_id'];
    _organizationId = json['organization_id'];
    _customerId = json['customer_id'];
    _paymentStatus = json['payment_status'];
    _orgCommission = json['org_commission'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _review = json['review'];
    _bookSeats = json['book_seats'];
    _seatDetails = json['seat_details'];
  }
  String? _eventId;
  String? _ticketId;
  String? _quantity;
  String? _couponDiscount;
  String? _payment;
  String? _tax;
  String? _paymentType;
  String? _paymentToken;
  String? _orderId;
  num? _organizationId;
  num? _customerId;
  num? _paymentStatus;
  num? _orgCommission;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
  dynamic _review;
  String? _bookSeats;
  String? _seatDetails;
  Data copyWith({
    String? eventId,
    String? ticketId,
    String? quantity,
    String? couponDiscount,
    String? payment,
    String? tax,
    String? paymentType,
    String? paymentToken,
    String? orderId,
    num? organizationId,
    num? customerId,
    num? paymentStatus,
    num? orgCommission,
    String? updatedAt,
    String? createdAt,
    num? id,
    dynamic review,
    String? bookSeats,
    String? seatDetails,
  }) =>
      Data(
        eventId: eventId ?? _eventId,
        ticketId: ticketId ?? _ticketId,
        quantity: quantity ?? _quantity,
        couponDiscount: couponDiscount ?? _couponDiscount,
        payment: payment ?? _payment,
        tax: tax ?? _tax,
        paymentType: paymentType ?? _paymentType,
        paymentToken: paymentToken ?? _paymentToken,
        orderId: orderId ?? _orderId,
        organizationId: organizationId ?? _organizationId,
        customerId: customerId ?? _customerId,
        paymentStatus: paymentStatus ?? _paymentStatus,
        orgCommission: orgCommission ?? _orgCommission,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
        review: review ?? _review,
        bookSeats: bookSeats ?? _bookSeats,
        seatDetails: seatDetails ?? _seatDetails,
      );
  String? get eventId => _eventId;
  String? get ticketId => _ticketId;
  String? get quantity => _quantity;
  String? get couponDiscount => _couponDiscount;
  String? get payment => _payment;
  String? get tax => _tax;
  String? get paymentType => _paymentType;
  String? get paymentToken => _paymentToken;
  String? get orderId => _orderId;
  num? get organizationId => _organizationId;
  num? get customerId => _customerId;
  num? get paymentStatus => _paymentStatus;
  num? get orgCommission => _orgCommission;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;
  dynamic get review => _review;
  String? get bookSeats => _bookSeats;
  String? get seatDetails => _seatDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_id'] = _eventId;
    map['ticket_id'] = _ticketId;
    map['quantity'] = _quantity;
    map['coupon_discount'] = _couponDiscount;
    map['payment'] = _payment;
    map['tax'] = _tax;
    map['payment_type'] = _paymentType;
    map['payment_token'] = _paymentToken;
    map['order_id'] = _orderId;
    map['organization_id'] = _organizationId;
    map['customer_id'] = _customerId;
    map['payment_status'] = _paymentStatus;
    map['org_commission'] = _orgCommission;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['review'] = _review;
    map['book_seats'] = _bookSeats;
    map['seat_details'] = _seatDetails;
    return map;
  }
}
