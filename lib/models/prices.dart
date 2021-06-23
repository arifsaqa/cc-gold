import 'package:flutter/material.dart';

class Price {
  final String label, price;
  final int id;

  Price({required this.label, required this.price, required this.id});
}

List<Price> prices = [
  Price(
    id: 1,
    label: "1 gram",
    price: "Rp. 853.252",
  ),
  Price(
    id: 1,
    label: "2 gram",
    price: "Rp. 1.706.504",
  ),
  Price(
    id: 1,
    label: "5 gram",
    price: "Rp. 4.266.260",
  ),
  Price(
    id: 1,
    label: "10 gram",
    price: "Rp. 8.532.520",
  ),
  Price(
    id: 1,
    label: "50 gram",
    price: "Rp. 42.662.600",
  ),
  Price(
    id: 1,
    label: "100 gram",
    price: "Rp. 85.325.200",
  )
];
