import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  int id;
  String name;
  IconData? icon;
  Category({required this.id, required this.name, this.icon});
}

final List<Category> categories = [
  Category(id: -1, name: "Any", icon: FontAwesomeIcons.award),
  Category(id: 9, name: "General Knowledge", icon: FontAwesomeIcons.earthAsia),
  Category(id: 11, name: "Film", icon: FontAwesomeIcons.video),
  Category(id: 10, name: "Books", icon: FontAwesomeIcons.bookOpen),
  Category(id: 12, name: "Music", icon: FontAwesomeIcons.music),
  Category(
      id: 13, name: "Musicals & Theatres", icon: FontAwesomeIcons.masksTheater),
  Category(id: 14, name: "Television", icon: FontAwesomeIcons.tv),
  Category(id: 15, name: "Video Games", icon: FontAwesomeIcons.gamepad),
  Category(id: 16, name: "Board Games", icon: FontAwesomeIcons.chessBoard),
  Category(id: 17, name: "Science & Nature", icon: FontAwesomeIcons.microscope),
  Category(id: 18, name: "Computer", icon: FontAwesomeIcons.laptopCode),
  Category(id: 19, name: "Maths", icon: FontAwesomeIcons.arrowDown19),
  Category(id: 20, name: "Mythology", icon: FontAwesomeIcons.dragon),
  Category(id: 21, name: "Sports", icon: FontAwesomeIcons.football),
  Category(id: 22, name: "Geography", icon: FontAwesomeIcons.mountain),
  Category(id: 23, name: "History", icon: FontAwesomeIcons.monument),
  Category(id: 24, name: "Politics", icon: FontAwesomeIcons.landmark),
  Category(id: 25, name: "Art", icon: FontAwesomeIcons.paintbrush),
  Category(id: 26, name: "Celebrities", icon: FontAwesomeIcons.star),
  Category(id: 27, name: "Animals", icon: FontAwesomeIcons.dog),
  Category(id: 28, name: "Vehicles", icon: FontAwesomeIcons.carRear),
  Category(id: 29, name: "Comics", icon: FontAwesomeIcons.bookOpen),
  Category(id: 30, name: "Gadgets", icon: FontAwesomeIcons.mobileScreenButton),
  Category(
      id: 31,
      name: "Japanese Anime & Manga",
      icon: FontAwesomeIcons.paintbrush),
  Category(id: 32, name: "Cartoon & Animation", icon: FontAwesomeIcons.c),
];
