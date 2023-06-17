import 'package:flutter/material.dart';

class WidgetWithoutPreCacheImage extends StatefulWidget {
  const WidgetWithoutPreCacheImage({super.key});

  @override
  State<WidgetWithoutPreCacheImage> createState() =>
      _WidgetWithoutPreCacheImageState();
}

class _WidgetWithoutPreCacheImageState
    extends State<WidgetWithoutPreCacheImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Without Precached"),
      ),
      body: const Center(
        child: Image(
          image: NetworkImage(
            'https://e0.pxfuel.com/wallpapers/270/390/desktop-wallpaper-picsart-blur-nature-background.jpg',
          ),
        ),
      ),
    );
  }
}
