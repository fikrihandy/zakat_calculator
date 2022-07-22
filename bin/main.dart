import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';

void main() {
  print(
      '\nMenghitung Zakat Maal\nBeri nilai 0 atau langsung enter untuk jika tidak ada.');

  int emasPerakAsset = inputRupiah("Asset Emas Perak");
  int uangAsset = inputRupiah("Asset Uang");
  int otherAsset = inputRupiah("Asset Lain");
  int hutangCicilan = inputRupiah("Hutang / Cicilan");

  ZakatMaal zakatMaal = ZakatMaal(
    emasPerakAsset,
    uangAsset,
    otherAsset,
    hutangCicilan,
  );
  zakatMaal.calculate();

  // Input by USER
  print(
      '\nMenghitung Zakat Penghasilan\nBeri nilai 0 atau langsung enter untuk jika tidak ada.');

  int penghasilanMonthly = inputRupiah('Penghasilan per bulan');
  int bonusThr = inputRupiah('Bonus / THR / dll');

  ZakatPenghasilan zakatPenghasilan = ZakatPenghasilan(
    penghasilanMonthly,
    bonusThr,
  );
  zakatPenghasilan.calculate();
}

int inputRupiah(String text) {
  stdout.write('$text = Rp.');
  try {
    int? rupiah = int.parse(stdin.readLineSync()!);
    return rupiah;
  } on Exception {
    return 0;
  }
}
