import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banner Slider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of images to display in the slider
    final List<String> imageUrls = [
      'https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg',
      'https://miro.medium.com/v2/resize:fit:20864/1*oM1GuZ0oC3_9v1GfKC2Egg.jpeg',
      'https://images.pexels.com/photos/7813575/pexels-photo-7813575.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://hips.hearstapps.com/hmg-prod/images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg?crop=0.6666666666666667xw:1xh;center,top&resize=1200:*'

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Foody Ai'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0, // Height of the slider
              autoPlay: true, // Enables auto-scrolling
              enlargeCenterPage: true, // Enlarges the center image
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to the Image Slider',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

