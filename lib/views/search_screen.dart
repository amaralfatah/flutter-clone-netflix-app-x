import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc/search_bloc.dart';
import '../constants.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/vertical_movie_grid_widget.dart';
import '../widgets/vertical_movie_list_widget.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: NetflixColorPallete.black,
        body: ListView(
          children: [
            const SearchBarWidget(),
            const SizedBox(height: 12.0),
            BlocBuilder<SearchBloc, SearchState>(
              bloc: BlocProvider.of<SearchBloc>(context)..add(SearchInitEvent()),
              buildWhen: (_, current) => current.status == SearchStatus.loaded ||
                current.status == SearchStatus.loadedSearchResult,
              builder: (context, state) {
                if (state.status == SearchStatus.loaded) {
                  return VerticalMovieListWidget(
                    title: "Now Playing", 
                    movies: state.movies,
                  );
                } else if (state.status == SearchStatus.loadedSearchResult) {
                  return VerticalMovieGridWidget(
                    title: "Results", 
                    movies: state.movies,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}