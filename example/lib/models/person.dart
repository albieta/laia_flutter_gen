import 'package:annotations/annotations.dart';
import 'package:example/config/api.dart';
import 'package:flutter/material.dart';
import 'package:example/generic/generic_widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'person.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@elementWidgetGen
@homeWidgetElement
class Person {
  final int id;
  final String name; 
  final String surname;
  final String address;
  final DateTime date;

  Person({required this.id, required this.name, required this.surname, required this.address, required this.date});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}