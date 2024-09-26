import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/specialization_data.dart';

const Color skyBlue = Color(0xff71b4fb);
const Color lightBlue = Color(0xff7fbcfb);

const Color orange = Color(0xfffa8c73);
const Color lightOrange = Color(0xfffa9881);

const Color purple = Color(0xff8873f4);
const Color purpleLight = Color(0xff9489f4);

const Color green = Color(0xff4cd1bc);
const Color lightGreen = Color(0xff5ed6c3);

class CardModel {
  String specialization;
  Color cardBackground;
  Color cardLightColor;

  CardModel(this.specialization, this.cardBackground, this.cardLightColor);
}

List<CardModel> cards = [
  CardModel(specialization[0], skyBlue, lightBlue), //القلب
  CardModel(
    specialization[1],
    green,
    lightGreen,
  ), //عام
  CardModel(
    specialization[2],
    orange,
    lightOrange,
  ), // نساء وتوليد
  CardModel(
    specialization[3],
    purple,
    purpleLight,
  ), // باطنه
  CardModel(
    specialization[4],
    green,
    lightGreen,
  ), // تجميل وترميم
  CardModel(
    specialization[5],
    skyBlue,
    lightBlue,
  ), //  اسنان
  CardModel(
    specialization[6],
    green,
    lightGreen,
  ), //  انف اذن
  CardModel(
    specialization[7],
    orange,
    lightOrange,
  ), // عيون
  CardModel(
    specialization[8],
    purple,
    purpleLight,
  ), //  عظام
  CardModel(
    specialization[9],
    green,
    lightGreen,
  ), // اطفال
];
