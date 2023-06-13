class MyProfileResponse {
  List<ShowUser>? showUser;
  MyProfileResponse({this.showUser});
  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    if (json['show_user'] != null) {
      showUser = <ShowUser>[];
      json['show_user'].forEach((v) {
        showUser!.add(new ShowUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showUser != null) {
      data['show_user'] = this.showUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowUser {
  int? userId;
  String? name;
  String? email;
  int? registerType;
  String? emailVerifiedAt;
  String? password;
  String? dob;
  String? gender;
  String? customGender;
  int? status;
  int? pronounId;
  String? customPronoun;
  String? weight;
  String? height;
  String? image;
  String? description;
  var userNotificationStatus;
  var countryId;
  var groupId;
  var customGroup;
  int? isTerm;
  int? isUnderstand;
  var dataSecurityAccepted;
  var isSocial;
  var googleCalSyncedStatus;
  int? focusId;
  var languageId;
  int? averageCycleLength;
  int? averageCycleDays;
  String? packageExpiryDate;
  String? periodDay;
  String? packageStartDate;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  ShowUser(
      {this.userId,
        this.name,
        this.email,
        this.registerType,
        this.emailVerifiedAt,
        this.password,
        this.dob,
        this.gender,
        this.customGender,
        this.status,
        this.pronounId,
        this.customPronoun,
        this.weight,
        this.height,
        this.image,
        this.description,
        this.userNotificationStatus,
        this.countryId,
        this.groupId,
        this.customGroup,
        this.isTerm,
        this.isUnderstand,
        this.dataSecurityAccepted,
        this.isSocial,
        this.googleCalSyncedStatus,
        this.focusId,
        this.languageId,
        this.averageCycleLength,
        this.averageCycleDays,
        this.packageExpiryDate,
        this.periodDay,
        this.packageStartDate,
        this.rememberToken,
        this.createdAt,
        this.updatedAt});

  ShowUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    registerType = json['register_type'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    dob = json['dob'];
    gender = json['gender'];
    customGender = json['custom_gender'];
    status = json['status'];
    pronounId = json['pronoun_id'];
    customPronoun = json['custom_pronoun'];
    weight = json['weight'];
    height = json['height'];
    image = json['image'];
    description = json['description'];
    userNotificationStatus = json['user_notification_status'];
    countryId = json['country_id'];
    groupId = json['group_id'];
    customGroup = json['custom_group'];
    isTerm = json['is_term'];
    isUnderstand = json['is_understand'];
    dataSecurityAccepted = json['data_security_accepted'];
    isSocial = json['is_social'];
    googleCalSyncedStatus = json['google_cal_synced_status'];
    focusId = json['focus_id'];
    languageId = json['language_id'];
    averageCycleLength = json['average_cycle_length'];
    averageCycleDays = json['average_cycle_days'];
    packageExpiryDate = json['package_expiry_date'];
    packageStartDate = json['package_start_date'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    periodDay = json['period_day'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['register_type'] = this.registerType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['custom_gender'] = this.customGender;
    data['status'] = this.status;
    data['pronoun_id'] = this.pronounId;
    data['custom_pronoun'] = this.customPronoun;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['image'] = this.image;
    data['description'] = this.description;
    data['user_notification_status'] = this.userNotificationStatus;
    data['country_id'] = this.countryId;
    data['group_id'] = this.groupId;
    data['custom_group'] = this.customGroup;
    data['is_term'] = this.isTerm;
    data['is_understand'] = this.isUnderstand;
    data['data_security_accepted'] = this.dataSecurityAccepted;
    data['is_social'] = this.isSocial;
    data['google_cal_synced_status'] = this.googleCalSyncedStatus;
    data['focus_id'] = this.focusId;
    data['language_id'] = this.languageId;
    data['average_cycle_length'] = this.averageCycleLength;
    data['average_cycle_days'] = this.averageCycleDays;
    data['package_expiry_date'] = this.packageExpiryDate;
    data['package_start_date'] = this.packageStartDate;
    data['remember_token'] = this.rememberToken;
    data['period_day'] = this.periodDay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
