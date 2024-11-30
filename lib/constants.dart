import 'package:flutter/material.dart';

class NetflixColorPallete {
  static const netflixRed = Color(0xFFE50914);
  static const symbolDarkRed = Color(0xFFB20710);
  static const mineShaft = Color(0xFF221F1F);
  static const black = Color(0xFF000000);
  static const cararra = Color(0xFFF5F5F1);
  static const grey = Color(0xFF564D4D);
  static const lightGrey = Color(0xFF989C8C);
  static const darkGrey = Color(0xFF393434);
}

enum HomeSectionType {
  trendingDay,
  trendingWeek,
  comedy,
  drama,
  history,
  horror,
}

class ArgumentKey {
  static const idKey = "id_key";
  static const movieGeneralKey = "movie_general_key";
}
