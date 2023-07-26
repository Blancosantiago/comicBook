
import 'dart:convert';

class PublishersSearchOutput {
  final String? error;
  final int? limit;
  final int? offset;
  final int? numberOfPageResults;
  final int? numberOfTotalResults;
  final int? statusCode;
  final ResultsSearch? results;
  final String? version;

  PublishersSearchOutput({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory PublishersSearchOutput.fromJson(String str) =>
      PublishersSearchOutput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PublishersSearchOutput.fromMap(Map<String, dynamic> json) =>
      PublishersSearchOutput(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results:
            json["results"] == null ? null : ResultsSearch.fromMap(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results?.toMap(),
        "version": version,
      };
}

class ResultsSearch {
  final String? aliases;
  final String? apiDetailUrl;
  final List<CharacterSearch>? characters;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final String? deck;
  final String? description;
  final int? id;
  final ImageSearch? image;
  final String? locationAddress;
  final String? locationCity;
  final String? locationState;
  final String? name;
  final String? siteDetailUrl;
  final List<CharacterSearch>? storyArcs;
  final List<CharacterSearch>? teams;
  final List<CharacterSearch>? volumes;

  ResultsSearch({
    this.aliases,
    this.apiDetailUrl,
    this.characters,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.id,
    this.image,
    this.locationAddress,
    this.locationCity,
    this.locationState,
    this.name,
    this.siteDetailUrl,
    this.storyArcs,
    this.teams,
    this.volumes,
  });

  factory ResultsSearch.fromJson(String str) =>
      ResultsSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultsSearch.fromMap(Map<String, dynamic> json) => ResultsSearch(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        characters: json["characters"] == null
            ? []
            : List<CharacterSearch>.from(
                json["characters"]!.map((x) => CharacterSearch.fromMap(x))),
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        dateLastUpdated: json["date_last_updated"] == null
            ? null
            : DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        id: json["id"],
        image:
            json["image"] == null ? null : ImageSearch.fromMap(json["image"]),
        locationAddress: json["location_address"],
        locationCity: json["location_city"],
        locationState: json["location_state"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        storyArcs: json["story_arcs"] == null
            ? []
            : List<CharacterSearch>.from(
                json["story_arcs"]!.map((x) => CharacterSearch.fromMap(x))),
        teams: json["teams"] == null
            ? []
            : List<CharacterSearch>.from(
                json["teams"]!.map((x) => CharacterSearch.fromMap(x))),
        volumes: json["volumes"] == null
            ? []
            : List<CharacterSearch>.from(
                json["volumes"]!.map((x) => CharacterSearch.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "characters": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x.toMap())),
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "id": id,
        "image": image?.toMap(),
        "location_address": locationAddress,
        "location_city": locationCity,
        "location_state": locationState,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "story_arcs": storyArcs == null
            ? []
            : List<dynamic>.from(storyArcs!.map((x) => x.toMap())),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "volumes": volumes == null
            ? []
            : List<dynamic>.from(volumes!.map((x) => x.toMap())),
      };
}

class CharacterSearch {
  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;

  CharacterSearch({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory CharacterSearch.fromJson(String str) =>
      CharacterSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterSearch.fromMap(Map<String, dynamic> json) => CharacterSearch(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}

class ImageSearch {
  final String? iconUrl;
  final String? mediumUrl;
  final String? screenUrl;
  final String? screenLargeUrl;
  final String? smallUrl;
  final String? superUrl;
  final String? thumbUrl;
  final String? tinyUrl;
  final String? originalUrl;
  final String? imageTags;

  ImageSearch({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory ImageSearch.fromJson(String str) =>
      ImageSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageSearch.fromMap(Map<String, dynamic> json) => ImageSearch(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toMap() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
