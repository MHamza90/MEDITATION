class ShowNewDiaryModel {
  bool? success;
  NewDiaryData? data;
  var message;

  ShowNewDiaryModel({this.success, this.data, this.message});

  ShowNewDiaryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new NewDiaryData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class NewDiaryData {
  var id;
  var userId;
  var moodScale;
  var emotionIds;
  var tellMore;
  var createdAt;
  var updatedAt;
  List<Emotions>? emotions;

  NewDiaryData(
      {this.id,
      this.userId,
      this.moodScale,
      this.emotionIds,
      this.tellMore,
      this.createdAt,
      this.updatedAt,
      this.emotions});

  NewDiaryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    moodScale = json['mood_scale'];
    emotionIds = json['emotion_ids'];
    tellMore = json['tell_more'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['emotions'] != null) {
      emotions = <Emotions>[];
      json['emotions'].forEach((v) {
        emotions!.add(new Emotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mood_scale'] = this.moodScale;
    data['emotion_ids'] = this.emotionIds;
    data['tell_more'] = this.tellMore;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.emotions != null) {
      data['emotions'] = this.emotions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Emotions {
  var id;
  var name;
  var slug;
  var lang;
  var status;
  var createdAt;
  var updatedAt;

  Emotions(
      {this.id,
      this.name,
      this.slug,
      this.lang,
      this.status,
      this.createdAt,
      this.updatedAt});

  Emotions.fromJson(Map<String, dynamic> json) {
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