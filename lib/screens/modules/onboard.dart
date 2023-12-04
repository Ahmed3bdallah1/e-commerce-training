import 'package:e_commerce_training/core/cubit/onboard/onboard_cubit.dart';
import 'package:e_commerce_training/core/cubit/onboard/onboard_state.dart';
import 'package:e_commerce_training/core/managers/Lists.dart';
import 'package:e_commerce_training/screens/widgets/botton.dart';
import 'package:e_commerce_training/screens/widgets/build_onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardCubit, OnboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        double height = MediaQuery.of(context).size.height;
        PageController controller = PageController();
        OnboardCubit cubit = OnboardCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 450,
                child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == onboard.length - 1) {
                      cubit.lastPage(index);
                    } else {
                      cubit.notLastPage(index);
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildOnBoardingItem(onboard[index], height),
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemCount: onboard.length,
                ),
              ),
              cubit.isLastPage
                  ? DefaultButton(
                      backgroundColor: Colors.indigo,
                      width: 200,
                      radius: 20,
                      childWidget: const Text("Get started"),
                      function: () {
                        cubit.submit(context);
                      })
                  : DefaultButton(
                      backgroundColor: Colors.indigo,
                      width: 200,
                      radius: 20,
                      childWidget: const Text("Next"),
                      function: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      })
            ],
          ),
        );
      },
    );
  }
}
