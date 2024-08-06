// To parse this JSON data, do
//
//     final openVideoModel = openVideoModelFromJson(jsonString);

import 'dart:convert';

OpenVideoModel openVideoModelFromJson(String str) =>
    OpenVideoModel.fromJson(json.decode(str));

String openVideoModelToJson(OpenVideoModel data) => json.encode(data.toJson());

class OpenVideoModel {
  Movie? movie;
  List<RecommendedMovie>? recommendedMovies;

  OpenVideoModel({
    this.movie,
    this.recommendedMovies,
  });

  factory OpenVideoModel.fromJson(Map<String, dynamic> json) => OpenVideoModel(
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        recommendedMovies: json["recommended_movies"] == null
            ? []
            : List<RecommendedMovie>.from(json["recommended_movies"]!
                .map((x) => RecommendedMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movie": movie?.toJson(),
        "recommended_movies": recommendedMovies == null
            ? []
            : List<dynamic>.from(recommendedMovies!.map((x) => x.toJson())),
      };
}

class Movie {
  dynamic id;
  dynamic languageDetail;
  dynamic categoryDetail;
  List<dynamic>? metaTags;
  List<dynamic>? videos;
  dynamic video;
  dynamic message;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic type;
  dynamic totalLength;
  dynamic collectionId;
  dynamic thumbnail;
  dynamic mobileThumbnail;
  dynamic freeVideo;
  dynamic rentVideo;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic admin;
  dynamic category;
  dynamic language;
  List<dynamic>? specs;

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
            : List<dynamic>.from(json["meta_tags"]!.map((x) => x)),
        videos: json["videos"] == null
            ? []
            : List<VideoClass>.from(
                json["videos"]!.map((x) => VideoClass.fromJson(x))),
        video:
            json["video"] == null ? null : VideoClass.fromJson(json["video"]),
        message: messageValues.map[json["message"]]!,
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        type: json["type"],
        totalLength: json["total_length"],
        collectionId: json["collection_id"],
        thumbnail: json["thumbnail"],
        mobileThumbnail: json["mobile_thumbnail"],
        freeVideo: json["free_video"] == null
            ? null
            : FreeVideo.fromJson(json["free_video"]),
        rentVideo: json["rent_video"] == null
            ? null
            : Video.fromJson(json["rent_video"]),
        status: json["status"],
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
            : List<dynamic>.from(json["specs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language_detail": languageDetail?.toJson(),
        "category_detail": categoryDetail?.toJson(),
        "meta_tags":
            metaTags == null ? [] : List<dynamic>.from(metaTags!.map((x) => x)),
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "video": video?.toJson(),
        "message": messageValues.reverse[message],
        "name": name,
        "slug": slug,
        "description": description,
        "type": type,
        "total_length": totalLength,
        "collection_id": collectionId,
        "thumbnail": thumbnail,
        "mobile_thumbnail": mobileThumbnail,
        "free_video": freeVideo?.toJson(),
        "rent_video": rentVideo?.toJson(),
        "status": status,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
        "category": category,
        "language": language,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
      };
}

class CategoryDetail {
  dynamic id;
  dynamic links;
  dynamic name;
  dynamic createdOn;
  dynamic updatedOn;
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
        name: json["name"],
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
        "name": name,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
      };
}

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
  dynamic id;
  dynamic name;
  dynamic code;
  dynamic position;
  dynamic createdOn;
  dynamic updatedOn;
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
        name: json["name"],
        code: json["code"],
        position: json["position"],
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
        "name": name,
        "code": code,
        "position": position,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
      };
}

enum Message { RESOLUTION_FINISHED }

final messageValues =
    EnumValues({"Resolution finished": Message.RESOLUTION_FINISHED});

class Video {
  Video();

  factory Video.fromJson(Map<String, dynamic> json) => Video();

  Map<String, dynamic> toJson() => {};
}

class VideoClass {
  dynamic id;
  dynamic videoUrlPlayer;
  dynamic name;
  dynamic videoUrl;
  dynamic videoGuid;
  dynamic response;
  dynamic oredrBy;
  dynamic length;
  dynamic thumbnail;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic movie;

  VideoClass({
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

  factory VideoClass.fromJson(Map<String, dynamic> json) => VideoClass(
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
  dynamic videoLibraryId;
  dynamic guid;
  dynamic title;
  dynamic dateUploaded;
  dynamic views;
  dynamic isPublic;
  dynamic length;
  dynamic status;
  dynamic framerate;
  dynamic rotation;
  dynamic width;
  dynamic height;
  dynamic availableResolutions;
  dynamic thumbnailCount;
  dynamic encodeProgress;
  dynamic storageSize;
  List<dynamic>? captions;
  dynamic hasMp4Fallback;
  dynamic collectionId;
  dynamic thumbnailFileName;
  dynamic averageWatchTime;
  dynamic totalWatchTime;
  dynamic category;
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

enum Category { GAMING, GRAPHICS, OTHER }

dynamic categoryValues = EnumValues({
  "gaming": Category.GAMING,
  "graphics": Category.GRAPHICS,
  "other": Category.OTHER
});

enum ThumbnailFileName { THUMBNAIL_JPG }

final thumbnailFileNameValues =
    EnumValues({"thumbnail.jpg": ThumbnailFileName.THUMBNAIL_JPG});

class RecommendedMovie {
  dynamic id;
  LanguageDetail? languageDetail;
  CategoryDetail? categoryDetail;
  List<dynamic>? metaTags;
  List<dynamic>? videos;
  dynamic video;
  dynamic message;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic type;
  dynamic totalLength;
  dynamic collectionId;
  dynamic thumbnail;
  dynamic mobileThumbnail;
  dynamic freeVideo;
  dynamic rentVideo;
  dynamic status;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic admin;
  dynamic category;
  dynamic language;
  List<dynamic>? specs;

  RecommendedMovie({
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

  factory RecommendedMovie.fromJson(Map<String, dynamic> json) =>
      RecommendedMovie(
        id: json["id"],
        languageDetail: json["language_detail"] == null
            ? null
            : LanguageDetail.fromJson(json["language_detail"]),
        categoryDetail: json["category_detail"] == null
            ? null
            : CategoryDetail.fromJson(json["category_detail"]),
        metaTags: json["meta_tags"] == null
            ? []
            : List<dynamic>.from(json["meta_tags"]!.map((x) => x)),
        videos: json["videos"] == null
            ? []
            : List<VideoClass>.from(
                json["videos"]!.map((x) => VideoClass.fromJson(x))),
        video:
            json["video"] == null ? null : VideoClass.fromJson(json["video"]),
        message: messageValues.map[json["message"]]!,
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        type: json["type"],
        totalLength: json["total_length"],
        collectionId: json["collection_id"],
        thumbnail: json["thumbnail"],
        mobileThumbnail: json["mobile_thumbnail"],
        freeVideo: json["free_video"] == null
            ? null
            : Video.fromJson(json["free_video"]),
        rentVideo: json["rent_video"] == null
            ? null
            : Video.fromJson(json["rent_video"]),
        status: json["status"],
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
            : List<dynamic>.from(json["specs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language_detail": languageDetail?.toJson(),
        "category_detail": categoryDetail?.toJson(),
        "meta_tags":
            metaTags == null ? [] : List<dynamic>.from(metaTags!.map((x) => x)),
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "video": video?.toJson(),
        "message": messageValues.reverse[message],
        "name": name,
        "slug": slug,
        "description": description,
        "type": type,
        "total_length": totalLength,
        "collection_id": collectionId,
        "thumbnail": thumbnail,
        "mobile_thumbnail": mobileThumbnail,
        "free_video": freeVideo?.toJson(),
        "rent_video": rentVideo?.toJson(),
        "status": status,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "admin": admin,
        "category": category,
        "language": language,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
