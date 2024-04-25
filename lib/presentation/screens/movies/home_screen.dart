import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //Nombre de la ruta
  static const name = "home-screen";
  final StatefulNavigationShell childView;

  const HomeScreen({
    super.key, 
    required this.childView
  });

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    return Scaffold(
      body: childView,
      bottomNavigationBar: location.startsWith('/movie') 
        ? null  
        : CustomBottomNavigation(currentChild: childView,),
    );
  }
}


