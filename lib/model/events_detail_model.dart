class EventsDetailModel {
  dynamic msg;
  Data? data;
  bool? success;

  EventsDetailModel({this.msg, this.data, this.success});

  EventsDetailModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? type;
  int? userId;
  int? scannerId;
  String? address;
  int? categoryId;
  String? image;
  List<String>? gallery;
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
  List<String>? hasTag;
  List<RecentEvent>? recentEvent;
  String? date;
  String? endDate;
  String? startTime;
  String? endTime;
  bool? isLike;
  bool? soldOut;
  String? imagePath;
  int? rate;
  dynamic totalTickets;
  dynamic soldTickets;
  List<Ticket>? ticket;
  Organization? organization;

  Data(
      {this.id,
      this.name,
      this.type,
      this.userId,
      this.scannerId,
      this.address,
      this.categoryId,
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
      this.hasTag,
      this.recentEvent,
      this.date,
      this.endDate,
      this.startTime,
      this.endTime,
      this.isLike,
      this.soldOut,
      this.imagePath,
      this.rate,
      this.totalTickets,
      this.soldTickets,
      this.ticket,
      this.organization});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    userId = json['user_id'];
    scannerId = json['scanner_id'];
    address = json['address'];
    categoryId = json['category_id'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
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
    hasTag = json['hasTag'].cast<String>();
    if (json['recent_event'] != null) {
      recentEvent = <RecentEvent>[];
      json['recent_event'].forEach((v) {
        recentEvent!.add(RecentEvent.fromJson(v));
      });
    }
    date = json['date'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isLike = json['isLike'];
    soldOut = json['sold_out'];
    imagePath = json['imagePath'];
    rate = json['rate'];
    totalTickets = json['totalTickets'];
    soldTickets = json['soldTickets'];
    if (json['ticket'] != null) {
      ticket = <Ticket>[];
      json['ticket'].forEach((v) {
        ticket!.add(Ticket.fromJson(v));
      });
    }
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
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
    data['hasTag'] = hasTag;
    if (recentEvent != null) {
      data['recent_event'] = recentEvent!.map((v) => v.toJson()).toList();
    }
    data['date'] = date;
    data['endDate'] = endDate;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['isLike'] = isLike;
    data['sold_out'] = soldOut;
    data['imagePath'] = imagePath;
    data['rate'] = rate;
    data['totalTickets'] = totalTickets;
    data['soldTickets'] = soldTickets;
    if (ticket != null) {
      data['ticket'] = ticket!.map((v) => v.toJson()).toList();
    }
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    return data;
  }
}

class RecentEvent {
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
  dynamic gallery;
  int? people;
  String? lat;
  String? lang;
  String? description;
  int? security;
  dynamic tags;
  int? status;
  String? eventStatus;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? time;
  bool? isLike;
  String? imagePath;
  int? rate;
  dynamic totalTickets;
  dynamic soldTickets;

  RecentEvent(
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
      this.time,
      this.isLike,
      this.imagePath,
      this.rate,
      this.totalTickets,
      this.soldTickets});

  RecentEvent.fromJson(Map<String, dynamic> json) {
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
    time = json['time'];
    isLike = json['isLike'];
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
    data['time'] = time;
    data['isLike'] = isLike;
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

class Organization {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  bool? isFollow;
  List<int>? followers;
  String? imagePath;

  Organization(
      {this.id, this.firstName, this.lastName, this.image, this.email, this.isFollow, this.followers, this.imagePath});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    email = json['email'];
    isFollow = json['isFollow'];
    followers = json['followers'].cast<int>();
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['email'] = email;
    data['isFollow'] = isFollow;
    data['followers'] = followers;
    data['imagePath'] = imagePath;
    return data;
  }
}
