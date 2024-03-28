class ExecutionListModel {
  bool? success;
  List<ExecutionData>? data;
  var message;

  ExecutionListModel({this.success, this.data, this.message});

  ExecutionListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ExecutionData>[];
      json['data'].forEach((v) {
        data!.add(new ExecutionData.fromJson(v));
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

class ExecutionData {
  var id;
  var name;
  var slug;
  var lang;
  var status;
  var createdAt;
  var updatedAt;

  ExecutionData(
      {this.id,
      this.name,
      this.slug,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt});

  ExecutionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    lang = json['lang'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['lang'] = this.lang;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}