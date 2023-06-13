class AppLanguageResponse {
  ShowLanguage? showLanguage;

  AppLanguageResponse({this.showLanguage});

  AppLanguageResponse.fromJson(Map<String, dynamic> json) {
    showLanguage = json['show_language'] != null
        ? new ShowLanguage.fromJson(json['show_language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showLanguage != null) {
      data['show_language'] = this.showLanguage!.toJson();
    }
    return data;
  }
}

class ShowLanguage {
  List<Language>? language;

  ShowLanguage({this.language});

  ShowLanguage.fromJson(Map<String, dynamic> json) {
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(new Language.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Language {
  int? languageId;
  String? langaugeName;
  String? langaugeCode;
  String? createdAt;
  String? updatedAt;

  Language(
      {this.languageId,
        this.langaugeName,
        this.langaugeCode,
        this.createdAt,
        this.updatedAt});

  Language.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    langaugeName = json['langauge_name'];
    langaugeCode = json['langauge_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_id'] = this.languageId;
    data['langauge_name'] = this.langaugeName;
    data['langauge_code'] = this.langaugeCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
