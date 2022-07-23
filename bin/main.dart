import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';

void main() {
  late bool continueApp;

  do {
    int inputMenu = showMenuAndGetInput();

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

        zakatPenghasilan.calculate();
        break;
    }

    continueApp = continueOrExit();
  } while (continueApp);
}

int showMenuAndGetInput() {
  int input;
  do {
    print("1. Menu 1\n2. Menu 2");
    stdout.write("Pilih menu (1) (2) = ");
    try {
      input = int.parse(stdin.readLineSync()!);
    } on Exception {
      stdout.write("Input salah! ");
      input = 0;
    }
    if (input > 2 || input < 1) {
      print('\nMenu tidak tersedia... ulangi...');
      continue;
    }
  } while (input > 2 || input < 1);
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
