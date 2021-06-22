import 'package:flutter/material.dart';

class News {
  final String image, title, date;
  final int id;

  News({this.image, this.title, this.date, this.id});
}

List<News> news = [
  News(
    id: 1,
    title: "Gold Down Over Firmer Dollar Investors Monitor U.S. Infla..",
    image: "images/news.png",
    date: "10 Juni 2021",
  ),
  News(
    id: 1,
    title: "Asian shares hold range as investors eye U.S. CPI",
    image: "images/news.png",
    date: "10 Juni 2021",
  ),
  News(
    id: 1,
    title: "Gold Price Could Hit Five Digits by 2030",
    image: "images/news.png",
    date: "10 Juni 2021",
  ),
];
