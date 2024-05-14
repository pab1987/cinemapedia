import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


class HumanFormats {

  HumanFormats() {
    initializeDateFormatting('es'); // Inicializar locale español
  }

  static String number( double number, [ int decimals = 0 ] ) {

    return NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(number);
  }

  static String shortDate( DateTime date ) {    
    final format = DateFormat.yMMMEd();
    return format.format(date);
  }

}