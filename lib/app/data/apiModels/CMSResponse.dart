class CMSResponse {
  ShowCms? showCms;

  CMSResponse({this.showCms});

  CMSResponse.fromJson(Map<String, dynamic> json) {
    showCms = json['show_cms'] != null
        ? new ShowCms.fromJson(json['show_cms'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showCms != null) {
      data['show_cms'] = this.showCms!.toJson();
    }
    return data;
  }
}

class ShowCms {
  List<Cms>? cms;

  ShowCms({this.cms});

  ShowCms.fromJson(Map<String, dynamic> json) {
    if (json['cms'] != null) {
      cms = <Cms>[];
      json['cms'].forEach((v) {
        cms!.add(new Cms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cms != null) {
      data['cms'] = this.cms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cms {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Cms(
      {this.id,
        this.title,
        this.shortDescription,
        this.longDescription,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  Cms.fromJson(Map<String, dynamic> json) {
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
