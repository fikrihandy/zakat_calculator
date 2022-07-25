import 'package:intl/intl.dart';

class ZakatCalculator {
  int goldPrice = 938099; // Rp.938.099 (https://baznas.go.id/kalkulatorzakat)

  String numToRupiah(num number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(number);
  }

  int goldPriceSetter(int newValue) {
    goldPrice = newValue;
    return goldPrice;
  }
}

abstract class Calculate {
  void calculate();

  double getNishab() => 0;
}
