import 'package:intl/intl.dart';

abstract class ZakatCalculator {
  int goldPrice = 202; //Rp.202
  
  String intToRupiah(int intNumber) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(intNumber);
  }
}

abstract class Calculate {
  void calculate() {}
}
