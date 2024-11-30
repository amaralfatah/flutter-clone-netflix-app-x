import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../bloc/my_list_bloc/my_list_bloc.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../constants.dart';
import '../service/netflix_shared_preferences.dart';
import '../service/tmdb_client_api.dart';
import '../service/token_interceptor.dart';
import 'home_screen.dart';
import 'my_list_screen.dart';
import 'search_screen.dart';

class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  late TmdbClientApi _tmdbClientApi;
  late NetflixSharedPreferences _sharedPreferences;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tmdbClientApi = TmdbClientApi(Dio()..interceptors.add(TokenInterceptor()));
    _sharedPreferences = NetflixSharedPreferences();
  }

  final List<Widget> _buildScreen = [
    const HomeScreen(),
    const SearchScreen(),
    const MyListScreen(),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (context) => HomeBloc(_tmdbClientApi)..add(HomeInitEvent())),
        BlocProvider(create:  (context) => SearchBloc(_tmdbClientApi)),
        BlocProvider(create:  (context) => MyListBloc(_sharedPreferences)),
        BlocProvider(create:  (context) => MovieDetailBloc(
          _tmdbClientApi,
          _sharedPreferences
        )),
      ],
      child: Scaffold(
        backgroundColor: NetflixColorPallete.black,
        body: _buildScreen.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: NetflixColorPallete.mineShaft,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: NetflixColorPallete.grey,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: NetflixColorPallete.cararra,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: NetflixColorPallete.grey,
              ),
              label: 'Search',
              activeIcon: Icon(
                Icons.search,
                color: NetflixColorPallete.cararra,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_play,
                color: NetflixColorPallete.grey,
              ),
              label: 'My List',
              activeIcon: Icon(
                Icons.playlist_play,
                color: NetflixColorPallete.cararra,
              ),
            ),
          ],
          selectedItemColor: NetflixColorPallete.cararra,
          unselectedItemColor: NetflixColorPallete.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTaped,
        ),
      ),
    );
  }
}