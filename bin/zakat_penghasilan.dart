import 'zakat_calculator.dart';

class ZakatPenghasilan extends ZakatCalculator implements Calculate {
  final int _penghasilanMonthly;
  final int _bonusThr;

  ZakatPenghasilan(this._penghasilanMonthly, this._bonusThr);

  int nishab() {
    return goldPrice * 2;
  }

  @override
  void calculate() {
    print('\n${'* ' * 8}\nZakat Penghasilan | Nishab = ${nishab()}');
    print('Calulating Zakat Penghasilan');
    print('Penghasilan / bln = ${intToRupiah(_penghasilanMonthly)}');
    print('Bonus / THR / dll = ${intToRupiah(_bonusThr)}');
  }
}
