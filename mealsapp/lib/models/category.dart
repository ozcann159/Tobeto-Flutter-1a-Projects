// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  //Ctor' da default değer 
  final String id;
  final String name;
  final Color color;
  const Category({
    required this.id,
    required this.name,
    this.color = Colors.orange,
  });
}
