import 'zakat_calculator.dart';

class ZakatPenghasilan extends ZakatCalculator implements Calculate {
  final int _penghasilanMonthly;
  final int _bonusThr;

  ZakatPenghasilan(this._penghasilanMonthly, this._bonusThr);

  @override
  double getNishab() {
    return (1 / 12) * (85 * goldPrice);
  }

  @override
  void calculate() {
    double nishab = getNishab();
    print('\n${'* ' * 8}\nZakat Penghasilan | Nishab = ${numToRupiah(nishab)}');
    print('Menghitung Zakat Penghasilan (Bulanan)');
    print('Penghasilan / bln = ${numToRupiah(_penghasilanMonthly)}');
    print('Bonus / THR / dll (bulan ini) = ${numToRupiah(_bonusThr)}');
    int total = _penghasilanMonthly + _bonusThr;
    double zakat = total * 2.5 / 100;
    if (total >= nishab) {
      print(
          '${'* ' * 8}\nTotal Pendapatan = ${numToRupiah(total)} (bulan ini)\nZakat Penghasilan = ${numToRupiah(zakat)}');
    } else {
      print(
          '\nTidak memenuhi Nishab, (- ${numToRupiah(nishab - total)} lagi untuk terpenuhi)');
    }
  }
}
