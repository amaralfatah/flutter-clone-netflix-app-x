import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc/search_bloc.dart';
import '../constants.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? searchOnStoppedTyping;

  void _onChangeHandler(BuildContext context, String value) {
    const duration = Duration(milliseconds: 800);

    if (searchOnStoppedTyping != null) {
      setState(() {
        searchOnStoppedTyping!.cancel();
      });
    }

    setState(() {
      searchOnStoppedTyping = Timer(duration, () {
        BlocProvider.of<SearchBloc>(context).add(SearchQueryEvent(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: const BoxDecoration(
        color: NetflixColorPallete.darkGrey,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 2.0
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: NetflixColorPallete.grey,
            size: 28.0,
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                _onChangeHandler(context, value);
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: NetflixColorPallete.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 9.0,
                ),
              ),
              style: const TextStyle(
                color: NetflixColorPallete.cararra,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                decorationThickness: 0,
              ),
              cursorColor: NetflixColorPallete.cararra,
              autofocus: true,
            ),
          ),
        ],
      ),
    );
  }
}