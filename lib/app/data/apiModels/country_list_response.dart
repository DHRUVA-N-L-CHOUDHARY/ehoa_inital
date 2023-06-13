class CountryListResponse {
  ShowCountry? showCountry;

  CountryListResponse({this.showCountry});

  CountryListResponse.fromJson(Map<String, dynamic> json) {
    showCountry = json['show_country'] != null
        ? ShowCountry.fromJson(json['show_country'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (showCountry != null) {
      data['show_country'] = showCountry!.toJson();
    }
    return data;
  }
}

class ShowCountry {
  List<CountryList>? country;

  ShowCountry({this.country});

  ShowCountry.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <CountryList>[];
      json['country'].forEach((v) {
        country!.add(new CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryList {
  int? countryId;
  String? countryName;
  String? countryCode;
  String? createdAt;
  String? updatedAt;

  CountryList(
      {this.countryId,
        this.countryName,
        this.countryCode,
        this.createdAt,
        this.updatedAt});

  CountryList.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_code'] = this.countryCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
