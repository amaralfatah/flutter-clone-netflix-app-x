import 'package:flutter/material.dart';

import '../constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: NetflixColorPallete.cararra,
        strokeWidth: 2.0,
      ),
    );
  }
}
