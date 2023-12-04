import 'package:e_commerce_training/models/onboard/onboard_model.dart';
import 'package:flutter/material.dart';

Widget buildOnBoardingItem(OnboardModel model, double height) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: height * .4,
              child: Image(image: AssetImage(model.image!))),
          const SizedBox(height: 10),
          Text(model.title!,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 40)),
          const SizedBox(height: 10),
          Text(model.subTitle!,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        ],
      ),
    );
