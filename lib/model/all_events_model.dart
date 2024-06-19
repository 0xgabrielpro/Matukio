class AllEventsModel {
  AllEventsModel({
    dynamic msg,
    Data? data,
    bool? success,
  }) {
    _msg = msg;
    _data = data;
    _success = success;
  }

  AllEventsModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
  }
  dynamic _msg;
  Data? _data;
  bool? _success;
  AllEventsModel copyWith({
    dynamic msg,
    Data? data,
    bool? success,
  }) =>
      AllEventsModel(
        msg: msg ?? _msg,
        data: data ?? _data,
        success: success ?? _success,
      );
  dynamic get msg => _msg;
  Data? get data => _data;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    return map;
  }
}

class Data {
  Data({List<Events>? events}) {
    _events = events;
  }

  Data.fromJson(dynamic json) {
    if (json['events'] != null) {
      _events = [];
      json['events'].forEach((v) {
        _events?.add(Events.fromJson(v));
      });
    }
  }
  List<Events>? _events;
  Data copyWith({
    List<Events>? events,
  }) =>
      Data(
        events: events ?? _events,
      );
  List<Events>? get events => _events;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_events != null) {
      map['events'] = _events?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class Ticket {
  Ticket({
    num? id,
    num? eventId,
    num? userId,
    String? ticketNumber,
    String? name,
    String? type,
    num? quantity,
    num? ticketPerOrder,
    String? startTime,
    String? endTime,
    num? price,
    String? description,
    num? status,
    num? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _eventId = eventId;
    _userId = userId;
    _ticketNumber = ticketNumber;
    _name = name;
    _type = type;
    _quantity = quantity;
    _ticketPerOrder = ticketPerOrder;
    _startTime = startTime;
    _endTime = endTime;
    _price = price;
    _description = description;
    _status = status;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Ticket.fromJson(dynamic json) {
    _id = json['id'];
    _eventId = json['event_id'];
    _userId = json['user_id'];
    _ticketNumber = json['ticket_number'];
    _name = json['name'];
    _type = json['type'];
    _quantity = json['quantity'];
    _ticketPerOrder = json['ticket_per_order'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _price = num.parse(json['price'].toString());
    _description = json['description'];
    _status = json['status'];
    _isDeleted = json['is_deleted'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _eventId;
  num? _userId;
  String? _ticketNumber;
  String? _name;
  String? _type;
  num? _quantity;
  num? _ticketPerOrder;
  String? _startTime;
  String? _endTime;
  num? _price;
  String? _description;
  num? _status;
  num? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  Ticket copyWith({
    num? id,
    num? eventId,
    num? userId,
    String? ticketNumber,
    String? name,
    String? type,
    num? quantity,
    num? ticketPerOrder,
    String? startTime,
    String? endTime,
    num? price,
    String? description,
    num? status,
    num? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) =>
      Ticket(
        id: id ?? _id,
        eventId: eventId ?? _eventId,
        userId: userId ?? _userId,
        ticketNumber: ticketNumber ?? _ticketNumber,
        name: name ?? _name,
        type: type ?? _type,
        quantity: quantity ?? _quantity,
        ticketPerOrder: ticketPerOrder ?? _ticketPerOrder,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        price: price ?? _price,
        description: description ?? _description,
        status: status ?? _status,
        isDeleted: isDeleted ?? _isDeleted,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get eventId => _eventId;
  num? get userId => _userId;
  String? get ticketNumber => _ticketNumber;
  String? get name => _name;
  String? get type => _type;
  num? get quantity => _quantity;
  num? get ticketPerOrder => _ticketPerOrder;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  num? get price => _price;
  String? get description => _description;
  num? get status => _status;
  num? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['event_id'] = _eventId;
    map['user_id'] = _userId;
    map['ticket_number'] = _ticketNumber;
    map['name'] = _name;
    map['type'] = _type;
    map['quantity'] = _quantity;
    map['ticket_per_order'] = _ticketPerOrder;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['price'] = _price;
    map['description'] = _description;
    map['status'] = _status;
    map['is_deleted'] = _isDeleted;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Events {
  Events({
    num? id,
    String? name,
    String? type,
    num? userId,
    num? scannerId,
    dynamic address,
    num? categoryId,
    String? startTime,
    String? endTime,
    String? image,
    String? gallery,
    num? people,
    dynamic lat,
    dynamic lang,
    String? description,
    num? security,
    String? tags,
    num? status,
    String? eventStatus,
    num? isDeleted,
    String? time,
    bool? isLike,
    String? imagePath,
    num? rate,
    dynamic totalTickets,
    dynamic soldTickets,
    List<Ticket>? ticket,
  }) {
    _id = id;
    _name = name;
    _type = type;
    _userId = userId;
    _scannerId = scannerId;
    _address = address;
    _categoryId = categoryId;
    _startTime = startTime;
    _endTime = endTime;
    _image = image;
    _gallery = gallery;
    _people = people;
    _lat = lat;
    _lang = lang;
    _description = description;
    _security = security;
    _tags = tags;
    _status = status;
    _eventStatus = eventStatus;
    _isDeleted = isDeleted;
    _time = time;
    _isLike = isLike;
    _imagePath = imagePath;
    _rate = rate;
    _totalTickets = totalTickets;
    _soldTickets = soldTickets;
    _ticket = ticket;
  }

  Events.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _userId = json['user_id'];
    _scannerId = json['scanner_id'];
    _address = json['address'];
    _categoryId = json['category_id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _image = json['image'];
    _gallery = json['gallery'];
    _people = json['people'];
    _lat = json['lat'];
    _lang = json['lang'];
    _description = json['description'];
    _security = json['security'];
    _tags = json['tags'];
    _status = json['status'];
    _eventStatus = json['event_status'];
    _isDeleted = json['is_deleted'];
    _time = json['time'];
    _isLike = json['isLike'];
    _imagePath = json['imagePath'];
    _rate = json['rate'];
    _totalTickets = json['totalTickets'];
    _soldTickets = json['soldTickets'];
    if (json['ticket'] != null) {
      _ticket = [];
      json['ticket'].forEach((v) {
        _ticket?.add(Ticket.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _type;
  num? _userId;
  num? _scannerId;
  dynamic _address;
  num? _categoryId;
  String? _startTime;
  String? _endTime;
  String? _image;
  String? _gallery;
  num? _people;
  dynamic _lat;
  dynamic _lang;
  String? _description;
  num? _security;
  String? _tags;
  num? _status;
  String? _eventStatus;
  num? _isDeleted;
  String? _time;
  bool? _isLike;
  String? _imagePath;
  num? _rate;
  dynamic _totalTickets;
  dynamic _soldTickets;
  List<Ticket>? _ticket;
  Events copyWith({
    num? id,
    String? name,
    String? type,
    num? userId,
    num? scannerId,
    dynamic address,
    num? categoryId,
    String? startTime,
    String? endTime,
    String? image,
    String? gallery,
    num? people,
    dynamic lat,
    dynamic lang,
    String? description,
    num? security,
    String? tags,
    num? status,
    String? eventStatus,
    num? isDeleted,
    String? time,
    bool? isLike,
    String? imagePath,
    num? rate,
    dynamic totalTickets,
    dynamic soldTickets,
    List<Ticket>? ticket,
  }) =>
      Events(
        id: id ?? _id,
        name: name ?? _name,
        type: type ?? _type,
        userId: userId ?? _userId,
        scannerId: scannerId ?? _scannerId,
        address: address ?? _address,
        categoryId: categoryId ?? _categoryId,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        image: image ?? _image,
        gallery: gallery ?? _gallery,
        people: people ?? _people,
        lat: lat ?? _lat,
        lang: lang ?? _lang,
        description: description ?? _description,
        security: security ?? _security,
        tags: tags ?? _tags,
        status: status ?? _status,
        eventStatus: eventStatus ?? _eventStatus,
        isDeleted: isDeleted ?? _isDeleted,
        time: time ?? _time,
        isLike: isLike ?? _isLike,
        imagePath: imagePath ?? _imagePath,
        rate: rate ?? _rate,
        totalTickets: totalTickets ?? _totalTickets,
        soldTickets: soldTickets ?? _soldTickets,
        ticket: ticket ?? _ticket,
      );
  num? get id => _id;
  String? get name => _name;
  String? get type => _type;
  num? get userId => _userId;
  num? get scannerId => _scannerId;
  dynamic get address => _address;
  num? get categoryId => _categoryId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get image => _image;
  String? get gallery => _gallery;
  num? get people => _people;
  dynamic get lat => _lat;
  dynamic get lang => _lang;
  String? get description => _description;
  num? get security => _security;
  String? get tags => _tags;
  num? get status => _status;
  String? get eventStatus => _eventStatus;
  num? get isDeleted => _isDeleted;
  String? get time => _time;
  bool? get isLike => _isLike;
  String? get imagePath => _imagePath;
  num? get rate => _rate;
  dynamic get totalTickets => _totalTickets;
  dynamic get soldTickets => _soldTickets;
  List<Ticket>? get ticket => _ticket;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['user_id'] = _userId;
    map['scanner_id'] = _scannerId;
    map['address'] = _address;
    map['category_id'] = _categoryId;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['image'] = _image;
    map['gallery'] = _gallery;
    map['people'] = _people;
    map['lat'] = _lat;
    map['lang'] = _lang;
    map['description'] = _description;
    map['security'] = _security;
    map['tags'] = _tags;
    map['status'] = _status;
    map['event_status'] = _eventStatus;
    map['is_deleted'] = _isDeleted;
    map['time'] = _time;
    map['isLike'] = _isLike;
    map['imagePath'] = _imagePath;
    map['rate'] = _rate;
    map['totalTickets'] = _totalTickets;
    map['soldTickets'] = _soldTickets;
    if (_ticket != null) {
      map['ticket'] = _ticket?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
