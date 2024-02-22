import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.pictureUrl,
    this.fit = BoxFit.cover,
  });

  final String pictureUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(pictureUrl, fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return const CircularProgressIndicator();
    });
  }
}
