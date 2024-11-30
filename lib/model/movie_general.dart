import 'package:json_annotation/json_annotation.dart';

part 'movie_general.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieGeneral {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final String? mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int>? genreIds;
  final double popularity;
  final String? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieGeneral({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.originalLanguage,
    this.adult = false,
    this.video = false,
    this.popularity = 0.0,
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.genreIds,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
    this.mediaType,
  });

  factory MovieGeneral.fromJson(Map<String, dynamic> json) => _$MovieGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$MovieGeneralToJson(this);
}
