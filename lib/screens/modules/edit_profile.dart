import 'package:e_commerce_training/core/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:e_commerce_training/core/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/screens/widgets/botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/cubit/edit_profile/edit_profile_state.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit profileCubit = ProfileCubit.get(context);
        EditProfileCubit cubit = EditProfileCubit.get(context);
        return Scaffold(
          body: Container(
            height: height,
            decoration: BoxDecoration(
                gradient: ConstantsColors().linearGradientWhiteBlue),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: "name",
                            hintText: profileCubit.userModel!.user!.name,
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: profileCubit.userModel!.user!.email,
                            prefixIcon: const Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            labelText: "phone",
                            hintText: profileCubit.userModel!.user!.phone,
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: DefaultButton(
                        function: () {
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              phoneController.text.isNotEmpty) {
                            cubit.updateProfile(
                                context: context,
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text);
                          }else{
                            showSnakBar(context, "make sure that u entered all data");
                          }
                        },
                        backgroundColor: Colors.indigo,
                        childWidget: const Text(
                          "confirm editing",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
