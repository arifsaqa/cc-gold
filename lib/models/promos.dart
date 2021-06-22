import 'package:flutter/material.dart';

class Promo {
  final String image, title;
  String? description;
  final int id;

  Promo(
      {required this.image,
      required this.title,
      this.description,
      required this.id});
}

List<Promo> promos = [
  Promo(
    id: 1,
    title: "Special Cashback Extra 25%",
    image: "images/promo1.png",
    description: "Special for Transactions Using GO-PAY",
  ),
  Promo(
    id: 1,
    title: "Free 0.5 Gram Gold Rain",
    image: "images/promo1.png",
    description: "First Transcation Special",
  ),
  Promo(
    id: 1,
    title: "Get 15% Discount with Referral Code",
    image: "images/promo1.png",
  ),
];
