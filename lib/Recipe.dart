import 'package:flutter/material.dart';
class Recipe {
  final String photoUrl;
  final String name;
  final int cookingTime; // час приготування у хвилинах

  Recipe({
    required this.photoUrl,
    required this.name,
    required this.cookingTime,
  });
}
