import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../constants.dart';
import '../model/movie_general.dart';
import '../views/movie_detail_screen.dart';
import 'movie_tile_widget.dart';
import 'title_list_widget.dart';

class VerticalMovieListWidget extends StatelessWidget {
  final String title;
  final List<MovieGeneral> movies;

  const VerticalMovieListWidget({
    required this.title,
    required this.movies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(
          padding: const EdgeInsets.only(
            left: 24.0,
          ),
          title: title,
        ),
        const SizedBox(height: 8.0),
        ListView.separated(
          padding: const EdgeInsets.only(
            bottom: 16.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MovieTileWidget(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<MovieDetailBloc>(context),
                      child: MovieDetailScreen(
                        arguments: {
                          ArgumentKey.idKey: movies[index].id,
                          ArgumentKey.movieGeneralKey: movies[index],
                        },
                      ),
                    );
                  }),
                );
              },
              title: movies[index].title, 
              assetPath: "https://image.tmdb.org/t/p/w500/${movies[index].backdropPath}",
            );
          }, 
          separatorBuilder: (_, __) {
            return const SizedBox(height: 8.0);
          }, 
          itemCount: movies.length,
        )
      ],
    );
  }
}
