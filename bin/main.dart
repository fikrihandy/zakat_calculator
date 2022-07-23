import 'dart:io';
import 'zakat_maal.dart';
import 'zakat_penghasilan.dart';

void main() {
  late bool continueApp = true;
  String exitApp = '';
  do {
    print('App');
    print("Ini akan diisi oleh Main APP");

    // continue or exit from App
    continueApp = continueOrExit(exitApp, continueApp);
  } while (continueApp);
}

bool continueOrExit(String exitApp, bool continueApp) {
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
