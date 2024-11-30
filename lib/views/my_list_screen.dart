import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_list_bloc/my_list_bloc.dart';
import '../constants.dart';
import '../widgets/empty_widget.dart';
import '../widgets/vertical_movie_list_widget.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My List",
          style: TextStyle(
            fontSize: 24.0,
            color: NetflixColorPallete.cararra,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.edit,
              color: NetflixColorPallete.cararra,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<MyListBloc, MyListState>(
          bloc: BlocProvider.of<MyListBloc>(context)..add(MyListInitEvent()),
          buildWhen: (_, current) => current.status == MyListStatus.loaded,
          builder: (context, state) {
            if (state.status == MyListStatus.loaded) {
              return VerticalMovieListWidget(
                title: "Favorites", 
                movies: state.movies,
              );
            } else if (state.status == MyListStatus.empty) {
              return const EmptyWidget();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}