// ignore_for_file: unused_element, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hesaplama/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenecekDersler = [];

  static dersEkle(Ders ders) {
    tumEklenecekDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenecekDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }

  static List<String> _tumDerslerinHarfleri() {
    return [
      'A1',
      'A2',
      'A3',
      'B1',
      'B2',
      'B3',
      'C1',
      'C2',
      'C3',
      'D1',
      'D2',
      'D3',
      'F1',
      'F'
    ];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'A1':
        return 4;
      case 'A2':
        return 3.75;
      case 'A3':
        return 3.50;
      case 'B1':
        return 3.25;
      case 'B2':
        return 3;
      case 'B3':
        return 2.75;
      case 'C1':
        return 2.50;
      case 'C2':
        return 2.25;
      case 'C3':
        return 2;
      case 'D1':
        return 1.75;
      case 'D2':
        return 1.50;
      case 'D3':
        return 1;
      case 'F1':
        return 0.5;
      case 'F':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
