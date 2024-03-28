class TrackerListModel {
  bool? success;
  List<TrackerListData>? data;
  var message;

  TrackerListModel({this.success, this.data, this.message});

  TrackerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <TrackerListData>[];
      json['data'].forEach((v) {
        data!.add(new TrackerListData.fromJson(v));
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

class TrackerListData {
  var id;
  var userId;
  var name;
  var executionId;
  var habitId;
  var lang;
  var status;
  var createdAt;
  var updatedAt;
  Habit? habit;
  Execution? execution;

  TrackerListData(
      {this.id,
      this.userId,
      this.name,
      this.executionId,
      this.habitId,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.habit,
      this.execution});

  TrackerListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    executionId = json['execution_id'];
    habitId = json['habit_id'];
    lang = json['lang'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    habit = json['habit'] != null ? new Habit.fromJson(json['habit']) : null;
    execution = json['execution'] != null
        ? new Execution.fromJson(json['execution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['execution_id'] = this.executionId;
    data['habit_id'] = this.habitId;
    data['lang'] = this.lang;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.habit != null) {
      data['habit'] = this.habit!.toJson();
    }
    if (this.execution != null) {
      data['execution'] = this.execution!.toJson();
    }
    return data;
  }
}

class Habit {
  var id;
  var image;
  var lang;
  var status;
  var createdAt;
  var updatedAt;

  Habit(
      {this.id,
      this.image,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt});

  Habit.fromJson(Map<String, dynamic> json) {
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

class Execution {
  var id;
  var name;
  var slug;
  var lang;
  var status;
  var createdAt;
  var updatedAt;

  Execution(
      {this.id,
      this.name,
      this.slug,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt});

  Execution.fromJson(Map<String, dynamic> json) {
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