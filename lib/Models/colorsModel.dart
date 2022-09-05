import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorsModel {
  final color;
  ColorsModel({this.color});
}

List<ColorsModel> colorsModel = [
  ColorsModel(color: HexColor('#F8B195')),
  ColorsModel(color: HexColor('#F67280')),
  ColorsModel(color: HexColor('#99B898')),
  ColorsModel(color: HexColor('#2A363B')),
  ColorsModel(color: HexColor('#A8E6CE')),
];
