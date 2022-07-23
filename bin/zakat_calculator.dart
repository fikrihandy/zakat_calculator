import 'package:intl/intl.dart';

abstract class ZakatCalculator {
  int goldPrice = 938099; // Rp.938.099 (https://baznas.go.id/kalkulatorzakat)

  String numToRupiah(num number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(number);
  }
}

abstract class Calculate {
  void calculate() {
    // Calculating Zakat
  }

  double getNishab() => 0;
}
