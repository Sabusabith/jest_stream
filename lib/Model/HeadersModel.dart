// To parse this JSON data, do
//
//     final headersModel = headersModelFromJson(jsonString);

import 'dart:convert';

List<HeadersModel> headersModelFromJson(String str) => List<HeadersModel>.from(
    json.decode(str).map((x) => HeadersModel.fromJson(x)));

String headersModelToJson(List<HeadersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeadersModel {
  dynamic id;
  dynamic isEdit;
  dynamic link;
  dynamic logo;
  dynamic name;
  dynamic headerType;
  dynamic linkType;
  dynamic linkId;
  dynamic sortOrder;
  dynamic isEditable;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic admin;
  dynamic platform;

  HeadersModel({
    required this.id,
    required this.isEdit,
    required this.link,
    this.logo,
    required this.name,
    required this.headerType,
    required this.linkType,
    required this.linkId,
    required this.sortOrder,
    required this.isEditable,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
    required this.admin,
    required this.platform,
  });

  factory HeadersModel.fromJson(Map<String, dynamic> json) => HeadersModel(
        id: json["id"],
        isEdit: json["is_edit"],
        link: json["link"],
        logo: json["logo"],
        name: json["name"],
        headerType: json["header_type"],
        linkType: json["link_type"],
        linkId: json["link_id"],
        sortOrder: json["sort_order"],
        isEditable: json["is_editable"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        admin: json["admin"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_edit": isEdit,
        "link": link,
        "logo": logo,
        "name": name,
        "header_type": headerType,
        "link_type": linkType,
        "link_id": linkId,
        "sort_order": sortOrder,
        "is_editable": isEditable,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "admin": admin,
        "platform": platform,
      };
}
