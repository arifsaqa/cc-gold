import 'package:flutter/material.dart';

class Numbers {
  final String number;
  final int id;

  Numbers({required this.number, required this.id});
}

List<Numbers> numbers = [
  Numbers(
    id: 1,
    number: "0819 1234 56789",
  ),
  Numbers(
    id: 1,
    number: "0819 1235 56789",
  ),
  Numbers(
    id: 1,
    number: "0819 1236 56789",
  ),
];
