import 'package:flutter/material.dart';
import 'package:flutter_clone_netflix_app_x/constants.dart';

class MovieTileWidget extends StatelessWidget {
  final String title;
  final String assetPath;
  final void Function() onTap;
  const MovieTileWidget({
    required this.title,
    required this.assetPath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 140,
                child: Image.network(
                  assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      "assets/images/placeholder.jpg",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: NetflixColorPallete.cararra,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.play_circle_outline,
              color: NetflixColorPallete.cararra,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
