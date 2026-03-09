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

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageName}); 
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/${imageName.toLowerCase().replaceAll(' ', '_')}.jpg');
  }

}

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


class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
          context,
          Icons.call,
          'CALL',
          () => _showConfirmationDialog(
            context,
            action: 'Call',
            message: 'Do you want to call this destination?',
          ),
        ),
        _buildButtonColumn(
          context,
          Icons.near_me,
          'ROUTE',
          () => _showConfirmationDialog(
            context,
            action: 'Route',
            message: 'Do you want to open the route to this destination?',
          ),
        ),
        _buildButtonColumn(
          context,
          Icons.share,
          'SHARE',
          () => _showConfirmationDialog(
            context,
            action: 'Share',
            message: 'Do you want to share this destination?',
          ),
        ),
      ],
    );
  }

  Widget _buildButtonColumn(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    Color color = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
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
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(
    BuildContext context, {
    required String action,
    required String message,
  }) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$action Confirmation'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      debugPrint('${action.toLowerCase()} button confirmed');
    }
  }
}


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
