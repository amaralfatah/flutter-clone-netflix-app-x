import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}