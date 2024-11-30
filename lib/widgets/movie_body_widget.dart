import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_netflix_app_x/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_clone_netflix_app_x/constants.dart';
import 'package:flutter_clone_netflix_app_x/widgets/icon_label_widget.dart';
import 'package:flutter_clone_netflix_app_x/widgets/vertical_movie_grid_widget.dart';

import '../model/genre.dart';
import '../model/movie_details.dart';
import '../model/movie_general.dart';
import 'cta_button_widget.dart';

class MovieBodyWidget extends StatelessWidget {
  final MovieDetails movieDetails;
  final List<MovieGeneral> similarMovies;
  final bool isFavorite;
  final MovieGeneral? currentMovie;

  const MovieBodyWidget({
    required this.movieDetails,
    required this.similarMovies,
    required this.isFavorite,
    this.currentMovie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(
            movieDetails.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: NetflixColorPallete.cararra,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                "${_getYear(movieDetails.releaseDate)}",
                style: const TextStyle(
                  color: NetflixColorPallete.cararra,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4.0),
              const Text(
                "-",
                style: TextStyle(
                  color: NetflixColorPallete.cararra,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                "${movieDetails.runtime} Minutes",
                style: const TextStyle(
                  color: NetflixColorPallete.cararra,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          CtaButtonWidget(
            backgroundColor: NetflixColorPallete.cararra,
            onPressed: () {},
            text: const Text(
              "Play",
              style: TextStyle(
                color: NetflixColorPallete.mineShaft,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.play_arrow,
              color: NetflixColorPallete.mineShaft,
              size: 36.0,
            ),
          ),
          const SizedBox(height: 12.0),
          CtaButtonWidget(
            backgroundColor: NetflixColorPallete.mineShaft,
            onPressed: () {},
            text: const Text(
              "Dowbload",
              style: TextStyle(
                color: NetflixColorPallete.cararra,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.play_arrow,
              color: NetflixColorPallete.cararra,
              size: 36.0,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            movieDetails.overview,
            style: const TextStyle(
              color: NetflixColorPallete.cararra,
              fontSize: 13.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            "Genres: ${_getGenreLists(movieDetails.genres)}",
            style: const TextStyle(
              color: NetflixColorPallete.lightGrey,
              fontSize: 13.0,
              fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              IconLabelWidget(
                icon: isFavorite ? Icons.check : Icons.add, 
                label: "My List", 
                onTap: () {
                  if (currentMovie != null) {
                    BlocProvider
                      .of<MovieDetailBloc>(context)
                      .add(MovieDetailAddFavoriteEvent(
                        currentMovie!
                      ));
                  }
                },
              ),
              IconLabelWidget(
                icon: Icons.thumb_up, 
                label: "Rate", 
                onTap: () {
                  
                },
              ),
              IconLabelWidget(
                icon: Icons.send, 
                label: "Share", 
                onTap: () {
                  
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          VerticalMovieGridWidget(
            title: "More Like This", 
            movies: similarMovies,
            isMovieDetail: true,
          )
        ],
      ),
    );
  }

  int _getYear(String? dateString) {
    if (dateString != null) {
      DateTime dateTime = DateTime.parse(dateString);
      int year = dateTime.year;
      return year;
    }

    return 1970;
  }

  String _getGenreLists(List<Genre>? genres) {
    if (genres != null && genres.isNotEmpty) {
      List<String> genreNames = genres.map((e) => e.name).toList();
      return genreNames.join(", ");
    }
    return "No Information";
  }
}