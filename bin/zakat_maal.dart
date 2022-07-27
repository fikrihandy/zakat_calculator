import 'zakat.dart';

class ZakatMaal extends ZakatCalculator implements Calculate {
  final int _goldSilverAsset;
  final int _moneyAsset;
  final int _otherAsset;
  final int _debt;

  ZakatMaal(
    this._goldSilverAsset,
    this._moneyAsset,
    this._otherAsset,
    this._debt,
  );

  @override
  double getNishab() {
    return goldPrice * 85;
  }

  @override
  void calculate() {
    double nishab = getNishab();
    print('\n${'* ' * 8}\nZakat Maal | Nishab = ${numToRupiah(nishab)}');
    print('Menghitung Zakat Maal (Asset dalam 1 tahun ini)');
    print('Asset Emas Perak = ${numToRupiah(_goldSilverAsset)}');
    print('Asset Uang = ${numToRupiah(_moneyAsset)}');
    print('Asset Lain = ${numToRupiah(_otherAsset)}');
    print('Hutang / Cicilan = ${numToRupiah(_debt)}');
    int total = (_goldSilverAsset + _moneyAsset + _otherAsset) - _debt;
    double zakat = total * 2.5 / 100;
    if (total >= nishab) {
      print(
          '${'* ' * 8}\nTotal Asset = ${numToRupiah(total)} (tahun ini)\nZakat Maal = Rp. ${numToRupiah(zakat)}');
    } else {
      print(
          '\nTidak memenuhi Nishab, (- ${numToRupiah(nishab - total)} lagi untuk terpenuhi)');
    }
  }
}
