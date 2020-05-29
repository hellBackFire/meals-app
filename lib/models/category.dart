import 'package:flutter/material.dart';

class Category {
  final String id, title;
  final Color color;

  const Category({@required this.id, this.title, this.color = Colors.orange});
}
