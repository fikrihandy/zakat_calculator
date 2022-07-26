import 'zakat.dart';

class ZakatMaal extends ZakatCalculator implements Calculate {
  final int _emasPerakAsset;
  final int _uangAsset;
  final int _otherAsset;
  final int _hutangCicilan;

  ZakatMaal(
    this._emasPerakAsset,
    this._uangAsset,
    this._otherAsset,
    this._hutangCicilan,
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
    print('Asset Emas Perak = ${numToRupiah(_emasPerakAsset)}');
    print('Asset Uang = ${numToRupiah(_uangAsset)}');
    print('Asset Lain = ${numToRupiah(_otherAsset)}');
    print('Hutang / Cicilan = ${numToRupiah(_hutangCicilan)}');
    int total = (_emasPerakAsset + _uangAsset + _otherAsset) - _hutangCicilan;
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
