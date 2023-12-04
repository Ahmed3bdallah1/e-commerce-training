import 'package:flutter/material.dart';

class ConstantsColors {
  final primaryColor = const Color(0xff6b9dfc);
  final primarySecondColor = const Color(0xffff8473);
  final whiteBlueColor = const Color(0xffa1c6fd);
  final blueColor = const Color(0xff205cf1);
  final blackColor = const Color(0xff1a1d26);

  final greyColor = const Color(0xffd9dadb);

  final Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final Shader shader2 = const LinearGradient(
    colors: <Color>[Colors.white, Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final linearGradientBlue =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
      stops: [0.0,1.0]
  );
  final linearGradientYellow =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff2dfff5), Color(0xfffff878)],
      stops: [0.0,1.0]
  );
  final linearGradientWhiteBlue =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff6b9dfc), Color(0xffd9dadb)],
      stops: [0.0,1.0]
  );
  final linearGradientNeon =  const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff6157ff), Color(0xffee49fd)],
      stops: [0.0,1.0]
  );
  final linearGradientButterfly =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xffff4066), Color(0xfffff16a)],
      stops: [0.0,1.0]
  );
  final linearGradientMalibu =  const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff0700de), Color(0xffddffc9)],
      stops: [0.0,1.0]
  );
  final linearGradientPeace =  const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffff8473), Color(0xfffff9d2)],
      stops: [0.0,1.0]
  );


}