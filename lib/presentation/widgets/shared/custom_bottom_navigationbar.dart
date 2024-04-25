import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell currentChild;

  const CustomBottomNavigation({super.key, required this.currentChild});


  void onItemTapped(int index) {
    currentChild.goBranch(index, initialLocation: index == currentChild.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentChild.currentIndex,
      onTap: (index) => onItemTapped(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categorias'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'
        )
      ],
    );
  }
}