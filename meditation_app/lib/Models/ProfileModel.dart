class ProfileModel {
  bool? success;
  ProfileData? data;
  var message;

  ProfileModel({this.success, this.data, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  var id;
  var name;
  var email;
  var profilePhotoPath;
  var dateOfBirth;
  var avatar;
  var roleId;
  var userType;
  var googleId;
  var deviceToken;
  var lang;
  var otp;
  var displayHabit;
  var meditationReminder;
  var habitReminder;
  var isVerified;
  var status;
  var emailVerifiedAt;
  var createdAt;
  var updatedAt;
  var lastLoginAt;
  var lastLoginIp;
  var deletedAt;

  ProfileData(
      {this.id,
      this.name,
      this.email,
      this.profilePhotoPath,
      this.dateOfBirth,
      this.avatar,
      this.roleId,
      this.userType,
      this.googleId,
      this.deviceToken,
      this.lang,
      this.otp,
      this.displayHabit,
      this.meditationReminder,
      this.habitReminder,
      this.isVerified,
      this.status,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.lastLoginAt,
      this.lastLoginIp,
      this.deletedAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePhotoPath = json['profile_photo_path'];
    dateOfBirth = json['date_of_birth'];
    avatar = json['avatar'];
    roleId = json['role_id'];
    userType = json['user_type'];
    googleId = json['google_id'];
    deviceToken = json['device_token'];
    lang = json['lang'];
    otp = json['otp'];
    displayHabit = json['display_habit'];
    meditationReminder = json['meditation_reminder'];
    habitReminder = json['habit_reminder'];
    isVerified = json['is_verified'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLoginAt = json['last_login_at'];
    lastLoginIp = json['last_login_ip'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['date_of_birth'] = this.dateOfBirth;
    data['avatar'] = this.avatar;
    data['role_id'] = this.roleId;
    data['user_type'] = this.userType;
    data['google_id'] = this.googleId;
    data['device_token'] = this.deviceToken;
    data['lang'] = this.lang;
    data['otp'] = this.otp;
    data['display_habit'] = this.displayHabit;
    data['meditation_reminder'] = this.meditationReminder;
    data['habit_reminder'] = this.habitReminder;
    data['is_verified'] = this.isVerified;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_login_at'] = this.lastLoginAt;
    data['last_login_ip'] = this.lastLoginIp;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}