import 'zakat.dart';

class ZakatPenghasilan implements ZakatCalculator {
  final int _monthlyIncome;
  final int _bonus;

  ZakatPenghasilan(this._monthlyIncome, this._bonus);

  @override
  double getNishab() {
    return (1 / 12) * (85 * GoldPrice().goldPrice);
  }

  @override
  void calculate() {
    double nishab = getNishab();
    print('\n${'* ' * 8}\nZakat Penghasilan | Nishab = ${numToRupiah(nishab)}');
    print('Penghasilan / bln = ${numToRupiah(_monthlyIncome)}');
    print('Bonus / THR / dll (bulan ini) = ${numToRupiah(_bonus)}');
    int total = _monthlyIncome + _bonus;
    double zakat = total * 2.5 / 100;
    if (total >= nishab) {
      print('Menghitung Zakat Penghasilan (Bulanan)');
      print(
          '${'* ' * 8}\nTotal Pendapatan = ${numToRupiah(total)} (bulan ini)');
      print('Zakat Penghasilan = ${numToRupiah(zakat)}');
    } else {
      print(
          '\nTidak memenuhi Nishab, (- ${numToRupiah(nishab - total)} lagi untuk terpenuhi)');
    }
  }
}
