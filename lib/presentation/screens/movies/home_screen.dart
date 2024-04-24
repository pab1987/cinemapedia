import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //Nombre de la ruta
  static const name = "home-screen";
  final Widget childView;

  const HomeScreen({
    super.key, 
    required this.childView
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: childView,
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}


