import 'zakat_calculator.dart';

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
    print('Menghitung Zakat Maal');
    print('Asset Emas Perak = ${numToRupiah(_emasPerakAsset)}');
    print('Asset Uang = ${numToRupiah(_uangAsset)}');
    print('Asset Lain = ${numToRupiah(_otherAsset)}');
    print('Hutang / Cicilan = ${numToRupiah(_hutangCicilan)}');
    double zakat;
    if ((_emasPerakAsset + _uangAsset + _otherAsset) - _hutangCicilan >=
        nishab) {
      zakat = ((_emasPerakAsset + _uangAsset + _otherAsset) - _hutangCicilan) *
          2.5 /
          100;
      print('${'* ' * 8}\nZakat Maal = Rp. $zakat');
    } else {
      print('\nTidak memenuhi Nishab');
    }
  }
}
