import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../constants.dart';
import '../widgets/loading_widget.dart';
import '../widgets/movie_body_widget.dart';
import '../widgets/movie_image_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MovieDetailScreen({
    required this.arguments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColorPallete.black,
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        bloc: BlocProvider.of<MovieDetailBloc>(context)..add(MovieDetailInitEvent(arguments[ArgumentKey.idKey])),
        builder: (context, state) {
          if (state.status == MovieDetailStatus.loaded) {
            return ListView(
              children: [
                MovieImageWidget(imagePath: "https://image.tmdb.org/t/p/w500/${state.movieDetails.backdropPath}"),
                MovieBodyWidget(
                  currentMovie: arguments[ArgumentKey.movieGeneralKey],
                  movieDetails: state.movieDetails, 
                  similarMovies: state.similarMovies, 
                  isFavorite: state.isFavorite,
                )
              ],
            );
          } else if (state.status == MovieDetailStatus.loading) {
            return const LoadingWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}