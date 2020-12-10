// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.data,
  });

  List<Datum> data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
    this.status,
  });

  DatumKind kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;
  Status status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kind: datumKindValues.map[json["kind"]],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": datumKindValues.reverse[kind],
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
        "status": status.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    this.videoId,
    this.videoPublishedAt,
  });

  String videoId;
  DateTime videoPublishedAt;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        videoId: json["videoId"],
        videoPublishedAt: DateTime.parse(json["videoPublishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "videoPublishedAt": videoPublishedAt.toIso8601String(),
      };
}

enum DatumKind { YOUTUBE_PLAYLIST_ITEM }

final datumKindValues =
    EnumValues({"youtube#playlistItem": DatumKind.YOUTUBE_PLAYLIST_ITEM});

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
  });

  DateTime publishedAt;
  ChannelId channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  ChannelTitle channelTitle;
  PlaylistId playlistId;
  int position;
  ResourceId resourceId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: channelIdValues.map[json["channelId"]],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: channelTitleValues.map[json["channelTitle"]],
        playlistId: playlistIdValues.map[json["playlistId"]],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelIdValues.reverse[channelId],
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitleValues.reverse[channelTitle],
        "playlistId": playlistIdValues.reverse[playlistId],
        "position": position,
        "resourceId": resourceId.toJson(),
      };
}

enum ChannelId { U_CW_XD_FGE_E9_K_YZL_DD_R7_TG9_C_MW }

final channelIdValues = EnumValues({
  "UCwXdFgeE9KYzlDdR7TG9cMw": ChannelId.U_CW_XD_FGE_E9_K_YZL_DD_R7_TG9_C_MW
});

enum ChannelTitle { FLUTTER }

final channelTitleValues = EnumValues({"Flutter": ChannelTitle.FLUTTER});

enum PlaylistId { P_LJXRF2_Q8_RO_U23_X_GWZ3_KM7_S_QZF_TD_B996_I_G }

final playlistIdValues = EnumValues({
  "PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG":
      PlaylistId.P_LJXRF2_Q8_RO_U23_X_GWZ3_KM7_S_QZF_TD_B996_I_G
});

class ResourceId {
  ResourceId({
    this.kind,
    this.videoId,
  });

  ResourceIdKind kind;
  String videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: resourceIdKindValues.map[json["kind"]],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": resourceIdKindValues.reverse[kind],
        "videoId": videoId,
      };
}

enum ResourceIdKind { YOUTUBE_VIDEO }

final resourceIdKindValues =
    EnumValues({"youtube#video": ResourceIdKind.YOUTUBE_VIDEO});

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: Default.fromJson(json["standard"]),
        maxres: Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard.toJson(),
        "maxres": maxres.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Status {
  Status({
    this.privacyStatus,
  });

  PrivacyStatus privacyStatus;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        privacyStatus: privacyStatusValues.map[json["privacyStatus"]],
      );

  Map<String, dynamic> toJson() => {
        "privacyStatus": privacyStatusValues.reverse[privacyStatus],
      };
}

enum PrivacyStatus { PUBLIC }

final privacyStatusValues = EnumValues({"public": PrivacyStatus.PUBLIC});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
