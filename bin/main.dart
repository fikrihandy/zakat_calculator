import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';
import 'zakat_calculator.dart';

void main() {
  late bool continueApp;
  int inputGoldPrice = 0;
  bool defaultGoldPrice = true;

  do {
    int inputMenu = showMenuAndGetInput(defaultGoldPrice, inputGoldPrice);

    switch (inputMenu) {
      case 1:
        print(
          '\nMenghitung Zakat Maal\nBeri nilai 0 atau langsung enter untuk jika tidak ada.',
        );

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

        if (defaultGoldPrice == false) {
          zakatMaal.goldPriceSetter(inputGoldPrice);
          print(zakatMaal.goldPrice);
        } // check for gold price

        zakatMaal.calculate();
        break;

      case 2:
        print(
          '\nMenghitung Zakat Penghasilan\nBeri nilai 0 atau langsung enter untuk jika tidak ada.',
        );

        int penghasilanMonthly = inputRupiah('Penghasilan per bulan');
        int bonusThr = inputRupiah('Bonus / THR / dll');

        ZakatPenghasilan zakatPenghasilan = ZakatPenghasilan(
          penghasilanMonthly,
          bonusThr,
        );

        if (defaultGoldPrice == false) {
          zakatPenghasilan.goldPriceSetter(inputGoldPrice);
          print(zakatPenghasilan.goldPrice);
        } // check for gold price

        zakatPenghasilan.calculate();
        break;

      case 3:
        defaultGoldPrice = false;
        print('Masukkan harga emas terbaru');
        stdout.write('Harga Emas = Rp. ');
        try {
          inputGoldPrice = int.parse(stdin.readLineSync()!);
          if (inputGoldPrice < 0) {
            inputGoldPrice = inputGoldPrice * -1;
          }
          print('Harga Emas di-update = ${numToRupiah(inputGoldPrice)}');
        } on Exception {
          stdout.write("\nInput salah!, menggunakan nilai default.");
          defaultGoldPrice = true;
        }

        continueApp = true;
        continue;
    }
    continueApp = continueOrExit();
  } while (continueApp);
}

int showMenuAndGetInput(bool defaultGoldPrice, int inputGoldPrice) {
  int input;
  bool retryIsTrue;
  do {
    String keterangan = defaultGoldPrice == true
        ? "Default = "
        : "Manual = ${numToRupiah(inputGoldPrice)}";
    print(
        "* Kalkulator Zakat *\n1. Zakat Maal\n2. Zakat Penghasilan\n3. Sett Harga Emas Manual ($keterangan)");
    stdout.write("Pilih menu (1) (2) (3) = ");
    try {
      input = int.parse(stdin.readLineSync()!);
    } on Exception {
      stdout.write("\nInput salah! ");
      input = 0;
    }
    retryIsTrue = input > 3 || input < 1;
    if (retryIsTrue) {
      print('\nMenu tidak tersedia... ulangi...\n');
    }
  } while (retryIsTrue);
  return input;
}

bool continueOrExit() {
  String exitApp = '';
  bool continueApp = true;
  do {
    stdout.write('\nAkhiri aplikasi (y) / (N) ? ');
    try {
      exitApp = stdin.readLineSync()!.toLowerCase();
    } on Exception {
      exitApp = 'n';
    }
    if (exitApp == 'y') {
      print('\nKeluar dari aplikasi...');
      continueApp = false;
    } else if (exitApp == 'n') {
      stdout.write('\n');
      break;
    } else {
      print('Input salah!');
      exitApp = 'n';
    }
  } while (exitApp == 'n');
  return continueApp;
}

int inputRupiah(String text) {
  stdout.write('$text = Rp.');
  try {
    int? rupiah = int.parse(stdin.readLineSync()!);
    if (rupiah < 0) {
      return 0;
    } else {
      return rupiah;
    }
  } on Exception {
    return 0;
  }
}
