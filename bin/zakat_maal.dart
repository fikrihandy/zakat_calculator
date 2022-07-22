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

  int nishab() {
    return goldPrice * 3;
  }

  @override
  void calculate() {
    print('\n${'* ' * 8}\nZakat Maal | Nishab = ${nishab()}');
    print('Calulating Zakat Maal');
    print('Asset Emas Perak = ${intToRupiah(_emasPerakAsset)}');
    print('Asset Uang = ${intToRupiah(_uangAsset)}');
    print('Asset Lain = ${intToRupiah(_otherAsset)}');
    print('Hutang / Cicilan = ${intToRupiah(_hutangCicilan)}');
  }
}
