// To parse this JSON data, do
//
//     final moviesModelssModel = moviesModelssModelFromJson(jsonString);

import 'dart:convert';

MoviesModelssModel moviesModelssModelFromJson(String str) =>
    MoviesModelssModel.fromJson(json.decode(str));

String moviesModelssModelToJson(MoviesModelssModel data) =>
    json.encode(data.toJson());

class MoviesModelssModel {
  int? id;
  List<Block>? blocks;
  String? name;
  String? slug;
  bool? isEditable;
  bool? status;
  dynamic image;
  DateTime? createdOn;
  DateTime? updatedOn;
  int? admin;
  int? platform;
  int? theme;

  MoviesModelssModel({
    this.id,
    this.blocks,
    this.name,
    this.slug,
    this.isEditable,
    this.status,
    this.image,
    this.createdOn,
    this.updatedOn,
    this.admin,
    this.platform,
    this.theme,
  });

  factory MoviesModelssModel.fromJson(Map<String, dynamic> json) =>
      MoviesModelssModel(
        id: json["id"],
        blocks: json["blocks"] == null
            ? []
            : List<Block>.from(json["blocks"]!.map((x) => Block.fromJson(x))),
        name: json["name"],
        slug: json["slug"],
        isEditable: json["is_editable"],
        status: json["status"],
        image: json["image"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        admin: json["admin"],
        platform: json["platform"],
        theme: json["theme"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blocks": blocks == null
            ? []
            : List<dynamic>.from(blocks!.map((x) => x.toJson())),
        "name": name,
        "slug": slug,
        "is_editable": isEditable,
        "status": status,
        "image": image,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
        "platform": platform,
        "theme": theme,
      };
}

class Block {
  int? id;
  bool? isEdit;
  List<MetaTag>? metaTags;
  List<Movie>? movies;
  String? name;
  String? inputType;
  String? value;
  dynamic image;
  String? movieType;
  bool? status;
  DateTime? createdOn;
  DateTime? updatedOn;
  int? page;
  List<int>? languages;
  List<int>? specs;
  List<int>? categories;

  Block({
    this.id,
    this.isEdit,
    this.metaTags,
    this.movies,
    this.name,
    this.inputType,
    this.value,
    this.image,
    this.movieType,
    this.status,
    this.createdOn,
    this.updatedOn,
    this.page,
    this.languages,
    this.specs,
    this.categories,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        id: json["id"],
        isEdit: json["is_edit"],
        metaTags: json["meta_tags"] == null
            ? []
            : List<MetaTag>.from(
                json["meta_tags"]!.map((x) => MetaTag.fromJson(x))),
        movies: json["movies"] == null
            ? []
            : List<Movie>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
        name: json["name"],
        inputType: json["input_type"],
        value: json["value"],
        image: json["image"],
        movieType: json["movie_type"],
        status: json["status"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        page: json["page"],
        languages: json["languages"] == null
            ? []
            : List<int>.from(json["languages"]!.map((x) => x)),
        specs: json["specs"] == null
            ? []
            : List<int>.from(json["specs"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<int>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_edit": isEdit,
        "meta_tags": metaTags == null
            ? []
            : List<dynamic>.from(metaTags!.map((x) => x.toJson())),
        "movies": movies == null
            ? []
            : List<dynamic>.from(movies!.map((x) => x.toJson())),
        "name": name,
        "input_type": inputType,
        "value": value,
        "image": image,
        "movie_type": movieType,
        "status": status,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "page": page,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
      };
}

class MetaTag {
  int? id;
  Label? label;
  String? name;
  DateTime? createdOn;
  DateTime? updatedOn;
  int? spec;

  MetaTag({
    this.id,
    this.label,
    this.name,
    this.createdOn,
    this.updatedOn,
    this.spec,
  });

  factory MetaTag.fromJson(Map<String, dynamic> json) => MetaTag(
        id: json["id"],
        label: labelValues.map[json["label"]]!,
        name: json["name"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        spec: json["spec"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": labelValues.reverse[label],
        "name": name,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "spec": spec,
      };
}

enum Label { DIRECTOR, STAR, PRODUCER }

final labelValues = EnumValues({
  "Director": Label.DIRECTOR,
  "Producer": Label.PRODUCER,
  "Star": Label.STAR
});

class Movie {
  int? id;
  LanguageDetail? languageDetail;
  CategoryDetail? categoryDetail;
  List<MetaTag>? metaTags;
  List<Video>? videos;
  Video? video;
  Message? message;
  String? name;
  String? slug;
  String? description;
  Type? type;
  dynamic totalLength;
  String? collectionId;
  String? thumbnail;
  dynamic mobileThumbnail;
  FreeVideo? freeVideo;
  RentVideo? rentVideo;
  Status? status;
  DateTime? createdOn;
  DateTime? updatedOn;
  int? admin;
  int? category;
  int? language;
  List<int>? specs;

  Movie({
    this.id,
    this.languageDetail,
    this.categoryDetail,
    this.metaTags,
    this.videos,
    this.video,
    this.message,
    this.name,
    this.slug,
    this.description,
    this.type,
    this.totalLength,
    this.collectionId,
    this.thumbnail,
    this.mobileThumbnail,
    this.freeVideo,
    this.rentVideo,
    this.status,
    this.createdOn,
    this.updatedOn,
    this.admin,
    this.category,
    this.language,
    this.specs,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        languageDetail: json["language_detail"] == null
            ? null
            : LanguageDetail.fromJson(json["language_detail"]),
        categoryDetail: json["category_detail"] == null
            ? null
            : CategoryDetail.fromJson(json["category_detail"]),
        metaTags: json["meta_tags"] == null
            ? []
            : List<MetaTag>.from(
                json["meta_tags"]!.map((x) => MetaTag.fromJson(x))),
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        message: messageValues.map[json["message"]]!,
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        type: typeValues.map[json["type"]]!,
        totalLength: json["total_length"],
        collectionId: json["collection_id"],
        thumbnail: json["thumbnail"],
        mobileThumbnail: json["mobile_thumbnail"],
        freeVideo: json["free_video"] == null
            ? null
            : FreeVideo.fromJson(json["free_video"]),
        rentVideo: json["rent_video"] == null
            ? null
            : RentVideo.fromJson(json["rent_video"]),
        status: statusValues.map[json["status"]]!,
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        admin: json["admin"],
        category: json["category"],
        language: json["language"],
        specs: json["specs"] == null
            ? []
            : List<int>.from(json["specs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language_detail": languageDetail?.toJson(),
        "category_detail": categoryDetail?.toJson(),
        "meta_tags": metaTags == null
            ? []
            : List<dynamic>.from(metaTags!.map((x) => x.toJson())),
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "video": video?.toJson(),
        "message": messageValues.reverse[message],
        "name": name,
        "slug": slug,
        "description": description,
        "type": typeValues.reverse[type],
        "total_length": totalLength,
        "collection_id": collectionId,
        "thumbnail": thumbnail,
        "mobile_thumbnail": mobileThumbnail,
        "free_video": freeVideo?.toJson(),
        "rent_video": rentVideo?.toJson(),
        "status": statusValues.reverse[status],
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
        "category": category,
        "language": language,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
      };
}

class CategoryDetail {
  int? id;
  int? links;
  CategoryDetailName? name;
  DateTime? createdOn;
  DateTime? updatedOn;
  dynamic admin;

  CategoryDetail({
    this.id,
    this.links,
    this.name,
    this.createdOn,
    this.updatedOn,
    this.admin,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        id: json["id"],
        links: json["links"],
        name: categoryDetailNameValues.map[json["name"]]!,
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "links": links,
        "name": categoryDetailNameValues.reverse[name],
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
      };
}

enum CategoryDetailName { THRILLER, ACTION, DRAMA }

final categoryDetailNameValues = EnumValues({
  "Action": CategoryDetailName.ACTION,
  "Drama": CategoryDetailName.DRAMA,
  "Thriller": CategoryDetailName.THRILLER
});

class FreeVideo {
  bool? isFree;

  FreeVideo({
    this.isFree,
  });

  factory FreeVideo.fromJson(Map<String, dynamic> json) => FreeVideo(
        isFree: json["is_free"],
      );

  Map<String, dynamic> toJson() => {
        "is_free": isFree,
      };
}

class LanguageDetail {
  int? id;
  LanguageDetailName? name;
  Code? code;
  Position? position;
  DateTime? createdOn;
  DateTime? updatedOn;
  dynamic admin;

  LanguageDetail({
    this.id,
    this.name,
    this.code,
    this.position,
    this.createdOn,
    this.updatedOn,
    this.admin,
  });

  factory LanguageDetail.fromJson(Map<String, dynamic> json) => LanguageDetail(
        id: json["id"],
        name: languageDetailNameValues.map[json["name"]]!,
        code: codeValues.map[json["code"]]!,
        position: positionValues.map[json["position"]]!,
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": languageDetailNameValues.reverse[name],
        "code": codeValues.reverse[code],
        "position": positionValues.reverse[position],
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
      };
}

enum Code { EN, TL, HN }

final codeValues = EnumValues({"En": Code.EN, "Hn": Code.HN, "TL": Code.TL});

enum LanguageDetailName { ENGLISH, MALAYALAM, HINDI, TAMIL }

final languageDetailNameValues = EnumValues({
  "English": LanguageDetailName.ENGLISH,
  "Hindi": LanguageDetailName.HINDI,
  "Malayalam": LanguageDetailName.MALAYALAM,
  "Tamil": LanguageDetailName.TAMIL
});

enum Position { LEFT }

final positionValues = EnumValues({"Left": Position.LEFT});

enum Message { RESOLUTION_FINISHED }

final messageValues =
    EnumValues({"Resolution finished": Message.RESOLUTION_FINISHED});

class RentVideo {
  int? currency;
  bool? isRent;
  String? price;
  String? validity;
  String? duration;

  RentVideo({
    this.currency,
    this.isRent,
    this.price,
    this.validity,
    this.duration,
  });

  factory RentVideo.fromJson(Map<String, dynamic> json) => RentVideo(
        currency: json["currency"],
        isRent: json["is_rent"],
        price: json["price"],
        validity: json["validity"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "is_rent": isRent,
        "price": price,
        "validity": validity,
        "duration": duration,
      };
}

enum Status { PUBLISH }

final statusValues = EnumValues({"Publish": Status.PUBLISH});

enum Type { MOVIE }

final typeValues = EnumValues({"Movie": Type.MOVIE});

class Video {
  int? id;
  String? videoUrlPlayer;
  String? name;
  dynamic videoUrl;
  String? videoGuid;
  Response? response;
  int? oredrBy;
  dynamic length;
  dynamic thumbnail;
  Message? status;
  DateTime? createdOn;
  DateTime? updatedOn;
  int? movie;

  Video({
    this.id,
    this.videoUrlPlayer,
    this.name,
    this.videoUrl,
    this.videoGuid,
    this.response,
    this.oredrBy,
    this.length,
    this.thumbnail,
    this.status,
    this.createdOn,
    this.updatedOn,
    this.movie,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        videoUrlPlayer: json["video_url_player"],
        name: json["name"],
        videoUrl: json["video_url"],
        videoGuid: json["video_guid"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        oredrBy: json["oredr_by"],
        length: json["length"],
        thumbnail: json["thumbnail"],
        status: messageValues.map[json["status"]]!,
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        movie: json["movie"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_url_player": videoUrlPlayer,
        "name": name,
        "video_url": videoUrl,
        "video_guid": videoGuid,
        "response": response?.toJson(),
        "oredr_by": oredrBy,
        "length": length,
        "thumbnail": thumbnail,
        "status": messageValues.reverse[status],
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "movie": movie,
      };
}

class Response {
  int? videoLibraryId;
  String? guid;
  String? title;
  DateTime? dateUploaded;
  int? views;
  bool? isPublic;
  int? length;
  int? status;
  double? framerate;
  int? rotation;
  int? width;
  int? height;
  AvailableResolutions? availableResolutions;
  int? thumbnailCount;
  int? encodeProgress;
  int? storageSize;
  List<dynamic>? captions;
  bool? hasMp4Fallback;
  String? collectionId;
  ThumbnailFileName? thumbnailFileName;
  int? averageWatchTime;
  int? totalWatchTime;
  Category? category;
  List<dynamic>? chapters;
  List<dynamic>? moments;
  List<dynamic>? metaTags;
  List<dynamic>? transcodingMessages;

  Response({
    this.videoLibraryId,
    this.guid,
    this.title,
    this.dateUploaded,
    this.views,
    this.isPublic,
    this.length,
    this.status,
    this.framerate,
    this.rotation,
    this.width,
    this.height,
    this.availableResolutions,
    this.thumbnailCount,
    this.encodeProgress,
    this.storageSize,
    this.captions,
    this.hasMp4Fallback,
    this.collectionId,
    this.thumbnailFileName,
    this.averageWatchTime,
    this.totalWatchTime,
    this.category,
    this.chapters,
    this.moments,
    this.metaTags,
    this.transcodingMessages,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        videoLibraryId: json["videoLibraryId"],
        guid: json["guid"],
        title: json["title"],
        dateUploaded: json["dateUploaded"] == null
            ? null
            : DateTime.parse(json["dateUploaded"]),
        views: json["views"],
        isPublic: json["isPublic"],
        length: json["length"],
        status: json["status"],
        framerate: json["framerate"]?.toDouble(),
        rotation: json["rotation"],
        width: json["width"],
        height: json["height"],
        availableResolutions:
            availableResolutionsValues.map[json["availableResolutions"]]!,
        thumbnailCount: json["thumbnailCount"],
        encodeProgress: json["encodeProgress"],
        storageSize: json["storageSize"],
        captions: json["captions"] == null
            ? []
            : List<dynamic>.from(json["captions"]!.map((x) => x)),
        hasMp4Fallback: json["hasMP4Fallback"],
        collectionId: json["collectionId"],
        thumbnailFileName:
            thumbnailFileNameValues.map[json["thumbnailFileName"]]!,
        averageWatchTime: json["averageWatchTime"],
        totalWatchTime: json["totalWatchTime"],
        category: categoryValues.map[json["category"]]!,
        chapters: json["chapters"] == null
            ? []
            : List<dynamic>.from(json["chapters"]!.map((x) => x)),
        moments: json["moments"] == null
            ? []
            : List<dynamic>.from(json["moments"]!.map((x) => x)),
        metaTags: json["metaTags"] == null
            ? []
            : List<dynamic>.from(json["metaTags"]!.map((x) => x)),
        transcodingMessages: json["transcodingMessages"] == null
            ? []
            : List<dynamic>.from(json["transcodingMessages"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "videoLibraryId": videoLibraryId,
        "guid": guid,
        "title": title,
        "dateUploaded": dateUploaded?.toIso8601String(),
        "views": views,
        "isPublic": isPublic,
        "length": length,
        "status": status,
        "framerate": framerate,
        "rotation": rotation,
        "width": width,
        "height": height,
        "availableResolutions":
            availableResolutionsValues.reverse[availableResolutions],
        "thumbnailCount": thumbnailCount,
        "encodeProgress": encodeProgress,
        "storageSize": storageSize,
        "captions":
            captions == null ? [] : List<dynamic>.from(captions!.map((x) => x)),
        "hasMP4Fallback": hasMp4Fallback,
        "collectionId": collectionId,
        "thumbnailFileName": thumbnailFileNameValues.reverse[thumbnailFileName],
        "averageWatchTime": averageWatchTime,
        "totalWatchTime": totalWatchTime,
        "category": categoryValues.reverse[category],
        "chapters":
            chapters == null ? [] : List<dynamic>.from(chapters!.map((x) => x)),
        "moments":
            moments == null ? [] : List<dynamic>.from(moments!.map((x) => x)),
        "metaTags":
            metaTags == null ? [] : List<dynamic>.from(metaTags!.map((x) => x)),
        "transcodingMessages": transcodingMessages == null
            ? []
            : List<dynamic>.from(transcodingMessages!.map((x) => x)),
      };
}

enum AvailableResolutions {
  THE_360_P_480_P_720_P_240_P,
  THE_360_P_480_P_720_P_240_P_1080_P
}

final availableResolutionsValues = EnumValues({
  "360p,480p,720p,240p": AvailableResolutions.THE_360_P_480_P_720_P_240_P,
  "360p,480p,720p,240p,1080p":
      AvailableResolutions.THE_360_P_480_P_720_P_240_P_1080_P
});

enum Category {
  GAMING,
  GRAPHICS,
  OTHER,
  ILLUSTRATIONS,
  ANIMALS_DOGS,
  OTHER_PEOPLE
}

final categoryValues = EnumValues({
  "animals-dogs": Category.ANIMALS_DOGS,
  "gaming": Category.GAMING,
  "graphics": Category.GRAPHICS,
  "illustrations": Category.ILLUSTRATIONS,
  "other": Category.OTHER,
  "other-people": Category.OTHER_PEOPLE
});

enum ThumbnailFileName { THUMBNAIL_JPG }

final thumbnailFileNameValues =
    EnumValues({"thumbnail.jpg": ThumbnailFileName.THUMBNAIL_JPG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
