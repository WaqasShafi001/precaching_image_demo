import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class NetworkImageScreen extends StatefulWidget {
  const NetworkImageScreen({super.key});

  @override
  NetworkImageScreenState createState() => NetworkImageScreenState();
}

class NetworkImageScreenState extends State<NetworkImageScreen> {
  String imageUrl = '';
  String loadingTime = '';

  Future<void> loadImage() async {
    var startTime = DateTime.now().millisecondsSinceEpoch;
    var response = await http.get(Uri.parse(
        'https://e0.pxfuel.com/wallpapers/270/390/desktop-wallpaper-picsart-blur-nature-background.jpg'));
    var endTime = DateTime.now().millisecondsSinceEpoch;
    var elapsedTime = endTime - startTime;

    if (response.statusCode == 200) {
      var responseBody = response.body; // Extract the response body

      setState(() {
        imageUrl =
            'https://e0.pxfuel.com/wallpapers/270/390/desktop-wallpaper-picsart-blur-nature-background.jpg';
        loadingTime = elapsedTime.toString();
        log(responseBody);
      });
    } else {
      // Handle error cases
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Image Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    height: 200,
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loadImage,
              child: const Text('Load Image'),
            ),
            const SizedBox(height: 10),
            Text(
              'Loading time (ms): $loadingTime',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
