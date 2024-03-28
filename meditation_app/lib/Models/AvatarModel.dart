class AvatarModel {
  bool? success;
  List<AvatarData>? data;
  var message;

  AvatarModel({this.success, this.data, this.message});

  AvatarModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AvatarData>[];
      json['data'].forEach((v) {
        data!.add(new AvatarData.fromJson(v));
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

class AvatarData {
  var name;
  var path;

  AvatarData({this.name, this.path});

  AvatarData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}