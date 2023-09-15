import 'dart:io';
import 'package:flutter/material.dart';

double status_bar_height = Platform.isIOS ? 50 : 30;
double padding_bottom = Platform.isIOS ? 20 : 10;
double height_default = 71;
double height_header = status_bar_height + 70;

//marign - padding
const EdgeInsets padding_tiny = EdgeInsets.all(10);
const EdgeInsets padding_small = EdgeInsets.all(15);
const EdgeInsets padding_regular = EdgeInsets.all(20);
const EdgeInsets padding_medium = EdgeInsets.all(25);
const EdgeInsets padding_large = EdgeInsets.all(30);

//radius
const Radius radius_tiny = Radius.circular(5);
const Radius radius_small = Radius.circular(10);
const Radius radius_regular = Radius.circular(15);
const Radius radius_medium = Radius.circular(20);
const Radius radius_large = Radius.circular(30);

const double icon_tiny = 10;
const double icon_small = 15;
const double icon_regular = 20;
const double icon_medium = 25;
const double icon_large = 30;

const double text_size_normal = 12;
const double text_size_label = 14;
const double text_size_medium = 16;
const double text_size_sub = 18;
const double text_size_heading_2 = 20;
const double text_size_heading_1 = 22;
