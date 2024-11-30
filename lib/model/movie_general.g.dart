// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGeneral _$MovieGeneralFromJson(Map<String, dynamic> json) => MovieGeneral(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      originalLanguage: json['original_language'] as String,
      adult: json['adult'] as bool? ?? false,
      video: json['video'] as bool? ?? false,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$MovieGeneralToJson(MovieGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
