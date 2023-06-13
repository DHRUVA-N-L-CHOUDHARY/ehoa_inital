class GroupListResponse {
  List<ShowGroups>? showGroups;

  GroupListResponse({this.showGroups});

  GroupListResponse.fromJson(Map<String, dynamic> json) {
    if (json['show_groups'] != null) {
      showGroups = <ShowGroups>[];
      json['show_groups'].forEach((v) {
        showGroups!.add(new ShowGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showGroups != null) {
      data['show_groups'] = this.showGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowGroups {
  int? gId;
  String? groupName;
  int? status;
  String? createdAt;
  String? updatedAt;

  ShowGroups(
      {this.gId, this.groupName, this.status, this.createdAt, this.updatedAt});

  ShowGroups.fromJson(Map<String, dynamic> json) {
    gId = json['g_id'];
    groupName = json['group_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['g_id'] = this.gId;
    data['group_name'] = this.groupName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
