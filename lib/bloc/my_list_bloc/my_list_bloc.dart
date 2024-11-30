import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/movie_general.dart';
import '../../service/netflix_shared_preferences.dart';


part 'my_list_event.dart';
part 'my_list_state.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  final NetflixSharedPreferences _sharedPreferences;

  MyListBloc(
    this._sharedPreferences,
  ) : super(const MyListState()) {
    on<MyListInitEvent>(_onInitMyList);
  }

  void _onInitMyList(
    MyListInitEvent event,
    Emitter<MyListState> emit,
  ) async {
    final movies = await _sharedPreferences.getAllMovies();

    if (movies.isNotEmpty) {
      emit(
        MyListState(
          status: MyListStatus.loaded,
          movies: movies,
        )
      );
    } else {
      emit(
        const MyListState(
          status: MyListStatus.empty,
        )
      );
    }
  }
}