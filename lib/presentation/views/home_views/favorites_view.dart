import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


/* class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites movies'),
      ),
      body: const Center(
        child: Text('Favorites'),
      ),
    );
  }
} */

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://wxw.cinecalidad.gg/ver-pelicula/the-marvels/');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas'),
      ),
      body:  Center(
        child: Column(
          children: [
            const Text('Ver película 👇🏻'),
            const SizedBox(height: 10,),
            TextButton(onPressed: () {
              _launchURL(url);
            }, child: const Text('Click aquí'))
          ]
        ),
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

}





