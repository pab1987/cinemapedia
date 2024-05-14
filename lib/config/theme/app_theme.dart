import 'package:flutter/material.dart';

class AppTheme {

  //Aquí se cambia el tema de la apicación
  //TODO: Aregar provider para poner botón de selección de tema
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    brightness: Brightness.dark,
  );
}
