// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseData _$MovieResponseDataFromJson(Map<String, dynamic> json) =>
    MovieResponseData(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieGeneral.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$MovieResponseDataToJson(MovieResponseData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
