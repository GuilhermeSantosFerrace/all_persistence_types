import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSvgIcon(String pathName) => SvgPicture.asset(
  pathName,
  width: 48,
  height: 48,
);

Widget divisorListMain() => const Divider(
  height: 2,
  color: Colors.black12,
);