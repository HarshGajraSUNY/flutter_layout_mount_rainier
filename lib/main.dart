import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const Column(
          children: [
            ImageSection(imageName: 'Rainier'),
            TitleSection(
              name: 'Mount Rainer',
              location: 'Washington, United States',
            ),
            ButtonSection(),
            TextSection(
              description:
                  'Mount Rainier is a large active stratovolcano located 59 miles south-southeast of Seattle, in the state of Washington. '
                  'It is the highest mountain in the state and the Cascade Range, with an elevation of 14,411 feet (4,392 meters). Mount Rainier is considered one of the most dangerous volcanoes in the world due to its proximity to populated areas and its potential for large eruptions.',
            ),

          ],
        ),
      ),
    );
  }
}

// create a image section class for the location passed via argument and image stored in assets/images folder with name of the location in lowercase and underscore instead of space and .jpg extension
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageName}); 
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/${imageName.toLowerCase().replaceAll(' ', '_')}.jpg');
  }

}

// create a title section class which is a stateless widget and a row with a children : column of text , a star icon and number 45

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

// write button section with a row of three columns with an icon and text : call , route , share
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(context, Icons.call, 'CALL'),
        _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// create a text section contaning description of the location passed via argument
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description),
    );
  }
}
