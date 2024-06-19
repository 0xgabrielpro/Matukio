import 'package:eventright_pro_user/model/all_events_model.dart';

class FollowingModel {
  dynamic msg;
  List<FollowingData>? data;
  bool? success;

  FollowingModel({this.msg, this.data, this.success});

  FollowingModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <FollowingData>[];
      json['data'].forEach((v) {
        data!.add(FollowingData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    return data;
  }
}

class FollowingData {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic deviceToken;
  String? image;
  String? phone;
  dynamic bio;
  String? country;
  dynamic orgId;
  int? status;
  String? language;
  String? createdAt;
  String? updatedAt;
  bool? isFollow;
  List<int>? followers;
  String? imagePath;
  List<Events>? events;

  FollowingData(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.deviceToken,
      this.image,
      this.phone,
      this.bio,
      this.country,
      this.orgId,
      this.status,
      this.language,
      this.createdAt,
      this.updatedAt,
      this.isFollow,
      this.followers,
      this.imagePath,
      this.events});

  FollowingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    deviceToken = json['device_token'];
    image = json['image'];
    phone = json['phone'];
    bio = json['bio'];
    country = json['country'];
    orgId = json['org_id'];
    status = json['status'];
    language = json['language'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFollow = json['isFollow'];
    followers = json['followers'].cast<int>();
    imagePath = json['imagePath'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['device_token'] = deviceToken;
    data['image'] = image;
    data['phone'] = phone;
    data['bio'] = bio;
    data['country'] = country;
    data['org_id'] = orgId;
    data['status'] = status;
    data['language'] = language;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['isFollow'] = isFollow;
    data['followers'] = followers;
    data['imagePath'] = imagePath;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
