import 'package:flutter/material.dart';

class PaymentMethod {
  final String label, image;
  final int id;

  PaymentMethod({required this.label, required this.image, required this.id});
}

List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    id: 1,
    label: "Bank BNI",
    image: "images/banks/BNI.png",
  ),
  PaymentMethod(
    id: 2,
    label: "Bank BRI",
    image: "images/banks/BRI.png",
  ),
  PaymentMethod(
    id: 3,
    label: "Bank BSI",
    image: "images/banks/BSI.png",
  ),
  PaymentMethod(
    id: 4,
    label: "Permata Bank",
    image: "images/banks/PERMATA.png",
  ),
  PaymentMethod(
    id: 5,
    label: "Go-Pay",
    image: "images/banks/GOPAY.png",
  )
];
