import 'package:flutter/material.dart';
import 'package:precaching_image_demo/widget_with_precache_image.dart';

import 'widget_without_precache_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetHoldingBothWidget(),
    );
  }
}

class WidgetHoldingBothWidget extends StatelessWidget {
  const WidgetHoldingBothWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: WidgetWithPreCacheImage(),
          ),
          Expanded(
            flex: 5,
            child: WidgetWithoutPreCacheImage(),
          ),
        ],
      ),
    );
  }
}
