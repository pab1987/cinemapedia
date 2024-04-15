import 'dart:core';
import 'package:intl/intl.dart';

class CurrentDateWidget {

  String getFormattedDate() {
    // Obtener la fecha actual
    DateTime now = DateTime.now();

    // Formatear la fecha
    DateFormat formatter = DateFormat('EEEE d'); // Personaliza el formato aquí
    String formattedDate = formatter.format(now);

    return formattedDate;
  }
}
