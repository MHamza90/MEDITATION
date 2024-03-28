class ListDiaryModel {
  bool? success;
  List<ListDiaryData>? data;
  var message;

  ListDiaryModel({this.success, this.data, this.message});

  ListDiaryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ListDiaryData>[];
      json['data'].forEach((v) {
        data!.add(new ListDiaryData.fromJson(v));
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

class ListDiaryData {
  var id;
  var userId;
  var moodScale;
  var emotionIds;
  var tellMore;
  var createdAt;
  var updatedAt;

  ListDiaryData(
      {this.id,
      this.userId,
      this.moodScale,
      this.emotionIds,
      this.tellMore,
      this.createdAt,
      this.updatedAt});

  ListDiaryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    moodScale = json['mood_scale'];
    emotionIds = json['emotion_ids'];
    tellMore = json['tell_more'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}