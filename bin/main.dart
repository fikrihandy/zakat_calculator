import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';

void main() {
  late bool continueApp;

  do {
    int inputMenu = showMenuAndGetInput();

    switch (inputMenu) {
      case 1:
        print('menu 1');
        break;
      case 2:
        print('menu 2');
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

// ==> * * * Main App End * * * <== //

// ==> * * * Method in Main App Start * * * <== //

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
      //print('\n');
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

// ==> * * * Method in Main App End * * * <== //
