import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_netflix_app_x/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_clone_netflix_app_x/constants.dart';
import 'package:flutter_clone_netflix_app_x/views/movie_detail_screen.dart';

import '../model/movie_general.dart';
import 'rounded_image_widget.dart';
import 'title_list_widget.dart';

class VerticalMovieGridWidget extends StatelessWidget {
  final String title;
  final List<MovieGeneral> movies;
  final bool isMovieDetail;

  const VerticalMovieGridWidget({
    required this.title,
    required this.movies,
    this.isMovieDetail = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(
          padding: EdgeInsets.only(
            left: isMovieDetail ? 8.0 : 24.0,
          ),
          title: title,
        ),
        const SizedBox(height: 8.0),
        GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 82 / 96,
          ),
          itemBuilder: (context, index) {
            return RoundedImageWidget(
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
              path:
                  "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
            );
          },
          itemCount: _getItemCount(movies.length),
        ),
      ],
    );
  }

  int _getItemCount(int length) {
    if (length > 15) {
      return 15;
    } else {
      return length;
    }
  }
}
