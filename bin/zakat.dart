import 'package:intl/intl.dart';

abstract class ZakatCalculator {
  void calculate();

  double getNishab() => 0;
}

class GoldPrice {
  int goldPrice = 938099; // Rp.938.099 (https://baznas.go.id/kalkulatorzakat)
  void goldPriceSetter(int newValue) {
    goldPrice = newValue;
  }
}

String numToRupiah(num number) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  ).format(number);
}
