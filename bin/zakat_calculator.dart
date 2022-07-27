import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';
import 'zakat.dart';

void main() {
  late bool continueApp;
  int inputGoldPrice = 0;
  bool defaultGoldPrice = true;

  do {
    int inputMenu = showMenuAndGetInput(defaultGoldPrice, inputGoldPrice);

    switch (inputMenu) {
      case 1: // Zakat Maal
        print('\nMenghitung Zakat Maal');
        print('Beri nilai 0 atau langsung enter untuk jika tidak ada.');

        int goldSilverAsset = inputRupiah('Asset Emas Perak');
        int moneyAsset = inputRupiah('Asset Uang');
        int otherAsset = inputRupiah('Asset Lain');
        int debt = inputRupiah('Hutang / Cicilan');

        ZakatMaal zakatMaal = ZakatMaal(
          goldSilverAsset,
          moneyAsset,
          otherAsset,
          debt,
        );

        if (defaultGoldPrice == false) {
          GoldPrice().goldPriceSetter(inputGoldPrice);
        }

        zakatMaal.calculate();
        break;

      case 2: // Zakat Penghasilan
        print('\nMenghitung Zakat Penghasilan');
        print('Beri nilai 0 atau langsung enter untuk jika tidak ada.');

        int monthlyIncome = inputRupiah('Penghasilan / bln');
        int bonus = inputRupiah('Bonus / THR / dll (bulan ini)');

        ZakatPenghasilan zakatPenghasilan = ZakatPenghasilan(
          monthlyIncome,
          bonus,
        );

        if (defaultGoldPrice == false) {
          GoldPrice().goldPriceSetter(inputGoldPrice);
        }

        zakatPenghasilan.calculate();
        break;

      case 3: // Sett Harga Emas Manual
        defaultGoldPrice = false;
        print('Masukkan harga emas terbaru!');
        print('Masukkan "0" untuk mengembalikan harga default!');
        stdout.write('Harga Emas = Rp. ');
        try {
          inputGoldPrice = int.parse(stdin.readLineSync()!);
          if (inputGoldPrice < 0) {
            inputGoldPrice = inputGoldPrice * -1;
          } else if (inputGoldPrice == 0 ||
              inputGoldPrice == GoldPrice().goldPrice) {
            defaultGoldPrice = true;
            print('Menggunakan nilai default.\n');
          }
          if (defaultGoldPrice == false) {
            print('Harga Emas di-update = ${numToRupiah(inputGoldPrice)}\n');
          }
        } on Exception {
          print('Input salah!, menggunakan nilai default.\n');
          defaultGoldPrice = true;
        }
        continueApp = true;
        continue;
      case 4: // Exit
        break;
    }
    continueApp = continueOrExit();
  } while (continueApp);
}

int showMenuAndGetInput(bool defaultPrice, int inputPrice) {
  int input;
  bool retryIsTrue;
  do {
    String info = defaultPrice == true
        ? 'Default = ${numToRupiah(GoldPrice().goldPrice)}'
        : 'Manual = ${numToRupiah(inputPrice)}';
    print(
        '* Kalkulator Zakat *\n1. Zakat Maal\n2. Zakat Penghasilan\n3. Sett Harga Emas Manual ($info)\n4. Exit');
    stdout.write('Pilih menu (1) (2) (3) (4) = ');
    try {
      input = int.parse(stdin.readLineSync()!);
    } on Exception {
      stdout.write('\nInput salah! ');
      input = 0;
    }
    retryIsTrue = input > 4 || input < 1;
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
