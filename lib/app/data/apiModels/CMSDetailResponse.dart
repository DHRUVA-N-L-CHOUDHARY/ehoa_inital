class CMSDetailResponse {
  List<ShowPrivacySettings>? showPrivacySettings;

  CMSDetailResponse({this.showPrivacySettings});

  CMSDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['show_privacy_settings'] != null) {
      showPrivacySettings = <ShowPrivacySettings>[];
      json['show_privacy_settings'].forEach((v) {
        showPrivacySettings!.add(new ShowPrivacySettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showPrivacySettings != null) {
      data['show_privacy_settings'] =
          this.showPrivacySettings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowPrivacySettings {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  ShowPrivacySettings(
      {this.id,
        this.title,
        this.shortDescription,
        this.longDescription,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  ShowPrivacySettings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
