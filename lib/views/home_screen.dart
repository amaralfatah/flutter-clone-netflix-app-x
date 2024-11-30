import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc/home_bloc.dart';
import '../constants.dart';
import '../widgets/hero_movie_widget.dart';
import '../widgets/horizontal_movie_list_widget.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "For Beautifulcode",
          style: TextStyle(
            color: NetflixColorPallete.cararra,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.cast,
              color: NetflixColorPallete.cararra,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (_, current) => current.status == HomeStatus.loaded,
        builder: (context, state) {
          if (state.status == HomeStatus.loaded) {
            return ListView(
              children: [
                if (state.movie != null) HeroMovieWidget(movie: state.movie!),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                  movieSection: state.sections[0],
                ),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                  movieSection: state.sections[1],
                ),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                 movieSection: state.sections[2],
                ),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                  movieSection: state.sections[3],
                ),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                  movieSection: state.sections[4],
                ),
                const SizedBox(height: 12.0),
                HorizontalMovieListWidget(
                  movieSection: state.sections[5],
                ),
              ],
            );
          } else if (state.status == HomeStatus.loading) {
            return const LoadingWidget();
          }  else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}