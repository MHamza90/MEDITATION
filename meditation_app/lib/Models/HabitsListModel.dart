class HabitsListModel {
  bool? success;
  List<HabitsData>? data;
  var message;

  HabitsListModel({this.success, this.data, this.message});

  HabitsListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <HabitsData>[];
      json['data'].forEach((v) {
        data!.add(new HabitsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class HabitsData {
  var id;
  var image;
  var lang;
  var status;
  var createdAt;
  var updatedAt;

  HabitsData(
      {this.id,
      this.image,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt});

  HabitsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    lang = json['lang'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['lang'] = this.lang;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}