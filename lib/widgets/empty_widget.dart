import 'package:flutter/material.dart';
import 'package:flutter_clone_netflix_app_x/constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      width: double.infinity,
      child: const Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 100.0,
            color: NetflixColorPallete.cararra,
          ),
          SizedBox(height: 20.0),
          Text(
            "You don't have any lists",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: NetflixColorPallete.lightGrey,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Please add if it needed!",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: NetflixColorPallete.lightGrey,
            ),
          )
        ],
      ),
    );
  }
}