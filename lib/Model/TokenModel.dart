// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  dynamic success;
  dynamic name;
  dynamic libaryId;
  dynamic loginRequired;
  dynamic havePlan;
  List<Logo> logos;
  dynamic adminToken;
  List<SocialLink> socialLinks;

  TokenModel({
    required this.success,
    required this.name,
    required this.libaryId,
    required this.loginRequired,
    required this.havePlan,
    required this.logos,
    required this.adminToken,
    required this.socialLinks,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        success: json["success"],
        name: json["name"],
        libaryId: json["libary_id"],
        loginRequired: json["login_required"],
        havePlan: json["have_plan"],
        logos: List<Logo>.from(json["logos"].map((x) => Logo.fromJson(x))),
        adminToken: json["admin_token"],
        socialLinks: List<SocialLink>.from(
            json["social_links"].map((x) => SocialLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": name,
        "libary_id": libaryId,
        "login_required": loginRequired,
        "have_plan": havePlan,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "admin_token": adminToken,
        "social_links": List<dynamic>.from(socialLinks.map((x) => x.toJson())),
      };
}

class Logo {
  dynamic id;
  dynamic previewPhoto;
  dynamic name;
  dynamic image;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic admin;

  Logo({
    required this.id,
    required this.previewPhoto,
    required this.name,
    required this.image,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
    required this.admin,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        id: json["id"],
        previewPhoto: json["preview_photo"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "preview_photo": previewPhoto,
        "name": name,
        "image": image,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "admin": admin,
      };
}

class SocialLink {
  dynamic id;
  dynamic name;
  dynamic logo;
  dynamic icon;
  dynamic link;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic admin;

  SocialLink({
    required this.id,
    required this.name,
    this.logo,
    required this.icon,
    this.link,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
    required this.admin,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        icon: json["icon"],
        link: json["link"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "icon": icon,
        "link": link,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "admin": admin,
      };
}
