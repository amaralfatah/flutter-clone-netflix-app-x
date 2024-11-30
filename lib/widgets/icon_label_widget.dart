import 'package:flutter/material.dart';

import '../constants.dart';

class IconLabelWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onTap;
  const IconLabelWidget({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 92,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.0,
              color: NetflixColorPallete.cararra,
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style: const TextStyle(
                color: NetflixColorPallete.cararra,
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}