class OrderModel {
  bool? success;
  dynamic msg;
  Data? data;

  OrderModel({this.success, this.msg, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Upcoming>? upcoming;
  List<Past>? past;

  Data({this.upcoming, this.past});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(Upcoming.fromJson(v));
      });
    }
    if (json['past'] != null) {
      past = <Past>[];
      json['past'].forEach((v) {
        past!.add(Past.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (upcoming != null) {
      data['upcoming'] = upcoming!.map((v) => v.toJson()).toList();
    }
    if (past != null) {
      data['past'] = past!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upcoming {
  int? id;
  String? orderId;
  int? customerId;
  int? organizationId;
  int? eventId;
  int? ticketId;
  int? couponId;
  int? quantity;
  num? couponDiscount;
  int? tax;
  int? orgCommission;
  num? payment;
  String? paymentType;
  int? paymentStatus;
  String? paymentToken;
  String? orderStatus;
  int? orgPayStatus;
  String? createdAt;
  String? updatedAt;
  List<OrderChild>? orderChild;
  Review? review;
  Event? event;
  Ticket? ticket;

  Upcoming(
      {this.id,
      this.orderId,
      this.customerId,
      this.organizationId,
      this.eventId,
      this.ticketId,
      this.couponId,
      this.quantity,
      this.couponDiscount,
      this.tax,
      this.orgCommission,
      this.payment,
      this.paymentType,
      this.paymentStatus,
      this.paymentToken,
      this.orderStatus,
      this.orgPayStatus,
      this.createdAt,
      this.updatedAt,
      this.orderChild,
      this.review,
      this.event,
      this.ticket});

  Upcoming.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    eventId = json['event_id'];
    ticketId = json['ticket_id'];
    couponId = json['coupon_id'];
    quantity = json['quantity'];
    couponDiscount = num.parse(json['coupon_discount'].toString());
    tax = json['tax'];
    orgCommission = json['org_commission'];
    payment = num.parse(json['payment'].toString());
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    paymentToken = json['payment_token'];
    orderStatus = json['order_status'];
    orgPayStatus = json['org_pay_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_child'] != null) {
      orderChild = <OrderChild>[];
      json['order_child'].forEach((v) {
        orderChild!.add(OrderChild.fromJson(v));
      });
    }
    review = json['review'] != null ? Review.fromJson(json['review']) : null;
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    ticket = json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['customer_id'] = customerId;
    data['organization_id'] = organizationId;
    data['event_id'] = eventId;
    data['ticket_id'] = ticketId;
    data['coupon_id'] = couponId;
    data['quantity'] = quantity;
    data['coupon_discount'] = couponDiscount;
    data['tax'] = tax;
    data['org_commission'] = orgCommission;
    data['payment'] = payment;
    data['payment_type'] = paymentType;
    data['payment_status'] = paymentStatus;
    data['payment_token'] = paymentToken;
    data['order_status'] = orderStatus;
    data['org_pay_status'] = orgPayStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (orderChild != null) {
      data['order_child'] = orderChild!.map((v) => v.toJson()).toList();
    }
    if (review != null) {
      data['review'] = review!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    return data;
  }
}

class OrderChild {
  int? id;
  int? ticketId;
  int? orderId;
  int? customerId;
  String? ticketNumber;
  int? status;
  String? createdAt;
  String? updatedAt;

  OrderChild(
      {this.id,
      this.ticketId,
      this.orderId,
      this.customerId,
      this.ticketNumber,
      this.status,
      this.createdAt,
      this.updatedAt});

  OrderChild.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    orderId = json['order_id'];
    customerId = json['customer_id'];
    ticketNumber = json['ticket_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ticket_id'] = ticketId;
    data['order_id'] = orderId;
    data['customer_id'] = customerId;
    data['ticket_number'] = ticketNumber;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Review {
  int? id;
  int? userId;
  int? organizationId;
  int? orderId;
  int? eventId;
  String? message;
  int? rate;
  int? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Event? event;

  Review(
      {this.id,
      this.userId,
      this.organizationId,
      this.orderId,
      this.eventId,
      this.message,
      this.rate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.event});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    organizationId = json['organization_id'];
    orderId = json['order_id'];
    eventId = json['event_id'];
    message = json['message'];
    rate = json['rate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['organization_id'] = organizationId;
    data['order_id'] = orderId;
    data['event_id'] = eventId;
    data['message'] = message;
    data['rate'] = rate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? lastName;
  String? image;
  String? email;

  User({this.id, this.name, this.lastName, this.image, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    image = json['image'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
    data['image'] = image;
    data['email'] = email;
    return data;
  }
}

class Event {
  int? id;
  String? name;
  String? type;
  int? userId;
  int? scannerId;
  String? address;
  int? categoryId;
  String? startTime;
  String? endTime;
  String? image;
  String? gallery;
  int? people;
  String? lat;
  String? lang;
  String? description;
  int? security;
  String? tags;
  int? status;
  String? eventStatus;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  int? rate;
  dynamic totalTickets;
  dynamic soldTickets;

  Event(
      {this.id,
      this.name,
      this.type,
      this.userId,
      this.scannerId,
      this.address,
      this.categoryId,
      this.startTime,
      this.endTime,
      this.image,
      this.gallery,
      this.people,
      this.lat,
      this.lang,
      this.description,
      this.security,
      this.tags,
      this.status,
      this.eventStatus,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.rate,
      this.totalTickets,
      this.soldTickets});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    userId = json['user_id'];
    scannerId = json['scanner_id'];
    address = json['address'];
    categoryId = json['category_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    image = json['image'];
    gallery = json['gallery'];
    people = json['people'];
    lat = json['lat'];
    lang = json['lang'];
    description = json['description'];
    security = json['security'];
    tags = json['tags'];
    status = json['status'];
    eventStatus = json['event_status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['imagePath'];
    rate = json['rate'];
    totalTickets = json['totalTickets'];
    soldTickets = json['soldTickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['user_id'] = userId;
    data['scanner_id'] = scannerId;
    data['address'] = address;
    data['category_id'] = categoryId;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['image'] = image;
    data['gallery'] = gallery;
    data['people'] = people;
    data['lat'] = lat;
    data['lang'] = lang;
    data['description'] = description;
    data['security'] = security;
    data['tags'] = tags;
    data['status'] = status;
    data['event_status'] = eventStatus;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagePath'] = imagePath;
    data['rate'] = rate;
    data['totalTickets'] = totalTickets;
    data['soldTickets'] = soldTickets;
    return data;
  }
}

class Ticket {
  int? id;
  int? eventId;
  int? userId;
  String? ticketNumber;
  String? name;
  String? type;
  int? quantity;
  int? ticketPerOrder;
  String? startTime;
  String? endTime;
  num? price;
  String? description;
  int? status;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;

  Ticket(
      {this.id,
      this.eventId,
      this.userId,
      this.ticketNumber,
      this.name,
      this.type,
      this.quantity,
      this.ticketPerOrder,
      this.startTime,
      this.endTime,
      this.price,
      this.description,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    userId = json['user_id'];
    ticketNumber = json['ticket_number'];
    name = json['name'];
    type = json['type'];
    quantity = json['quantity'];
    ticketPerOrder = json['ticket_per_order'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    price = num.parse(json['price'].toString());
    description = json['description'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['event_id'] = eventId;
    data['user_id'] = userId;
    data['ticket_number'] = ticketNumber;
    data['name'] = name;
    data['type'] = type;
    data['quantity'] = quantity;
    data['ticket_per_order'] = ticketPerOrder;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['price'] = price;
    data['description'] = description;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Past {
  int? id;
  String? orderId;
  int? customerId;
  int? organizationId;
  int? eventId;
  int? ticketId;
  dynamic couponId;
  int? quantity;
  num? couponDiscount;
  int? tax;
  int? orgCommission;
  num? payment;
  String? paymentType;
  int? paymentStatus;
  String? paymentToken;
  String? orderStatus;
  int? orgPayStatus;
  String? createdAt;
  String? updatedAt;
  List<OrderChild>? orderChild;
  Review? review;
  Event? event;
  Ticket? ticket;

  Past(
      {this.id,
      this.orderId,
      this.customerId,
      this.organizationId,
      this.eventId,
      this.ticketId,
      this.couponId,
      this.quantity,
      this.couponDiscount,
      this.tax,
      this.orgCommission,
      this.payment,
      this.paymentType,
      this.paymentStatus,
      this.paymentToken,
      this.orderStatus,
      this.orgPayStatus,
      this.createdAt,
      this.updatedAt,
      this.orderChild,
      this.review,
      this.event,
      this.ticket});

  Past.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    eventId = json['event_id'];
    ticketId = json['ticket_id'];
    couponId = json['coupon_id'];
    quantity = json['quantity'];
    couponDiscount = num.parse(json['coupon_discount'].toString());
    tax = json['tax'];
    orgCommission = json['org_commission'];
    payment = num.parse(json['payment'].toString());
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    paymentToken = json['payment_token'];
    orderStatus = json['order_status'];
    orgPayStatus = json['org_pay_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_child'] != null) {
      orderChild = <OrderChild>[];
      json['order_child'].forEach((v) {
        orderChild!.add(OrderChild.fromJson(v));
      });
    }
    review = json['review'] != null ? Review.fromJson(json['review']) : null;
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    ticket = json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['customer_id'] = customerId;
    data['organization_id'] = organizationId;
    data['event_id'] = eventId;
    data['ticket_id'] = ticketId;
    data['coupon_id'] = couponId;
    data['quantity'] = quantity;
    data['coupon_discount'] = couponDiscount;
    data['tax'] = tax;
    data['org_commission'] = orgCommission;
    data['payment'] = payment;
    data['payment_type'] = paymentType;
    data['payment_status'] = paymentStatus;
    data['payment_token'] = paymentToken;
    data['order_status'] = orderStatus;
    data['org_pay_status'] = orgPayStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (orderChild != null) {
      data['order_child'] = orderChild!.map((v) => v.toJson()).toList();
    }
    if (review != null) {
      data['review'] = review!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    return data;
  }
}
