import 'package:flutter/material.dart';

class WidgetWithPreCacheImage extends StatefulWidget {
  const WidgetWithPreCacheImage({super.key});

  @override
  State<WidgetWithPreCacheImage> createState() =>
      _WidgetWithPreCacheImageState();
}

class _WidgetWithPreCacheImageState extends State<WidgetWithPreCacheImage> {
  final String imageUrl =
      'https://e0.pxfuel.com/wallpapers/988/343/desktop-wallpaper-nature-beautiful-nature.jpg';

  @override
  void didChangeDependencies() {
    //provide the image provider to precached Image
    precacheImage(NetworkImage(imageUrl), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Precached"),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
