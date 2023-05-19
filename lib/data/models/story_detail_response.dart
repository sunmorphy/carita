import 'dart:convert';

StoryDetailResponse storyDetailResponseFromJson(String str) => StoryDetailResponse.fromJson(json.decode(str));

String storyDetailResponseToJson(StoryDetailResponse data) => json.encode(data.toJson());

class StoryDetailResponse {
  StoryDetailResponse({
    required this.error,
    required this.message,
    required this.story,
  });

  bool error;
  String message;
  Story story;

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) => StoryDetailResponse(
    error: json["error"],
    message: json["message"],
    story: Story.fromJson(json["story"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "story": story.toJson(),
  };
}

class Story {
  Story({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    required this.lat,
    required this.lon,
  });

  String id;
  String name;
  String description;
  String photoUrl;
  DateTime createdAt;
  double? lat;
  double? lon;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    photoUrl: json["photoUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "photoUrl": photoUrl,
    "createdAt": createdAt.toIso8601String(),
    "lat": lat,
    "lon": lon,
  };
}