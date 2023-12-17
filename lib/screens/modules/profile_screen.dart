import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_training/core/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_training/core/cubit/profile/profile_state.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/core/managers/navigation.dart';
import 'package:e_commerce_training/screens/modules/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: ConstantsColors().linearGradientWhiteBlue),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: CachedNetworkImage(
                          imageUrl: cubit.userModel!.user!.profileImage!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.black),
                              ),
                          errorWidget: (context, url, error) {
                            print(error.toString());
                            return Center(
                                child: CircularProgressIndicator(
                                    color: HexColor('#07094D')));
                          }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Name"),
                            Text(cubit.userModel!.user!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Email"),
                            Text(cubit.userModel!.user!.email!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("National ID"),
                            Text(cubit.userModel!.user!.nationalId!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Phone"),
                            Text(cubit.userModel!.user!.phone!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        cubit.userModel!.user!.gender == "male"
                            ? const Icon(
                                Icons.check_box,
                                color: Colors.white,
                              )
                            : const Icon(Icons.check_box_outline_blank),
                        const Text("Male"),
                        const SizedBox(width: 10),
                        cubit.userModel!.user!.gender == "female"
                            ? const Icon(
                                Icons.check_box,
                                color: Colors.white,
                              )
                            : const Icon(Icons.check_box_outline_blank),
                        const Text("Female"),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            navigateToNextScreen(context, const EditProfile());
                          },
                          child: const Row(
                            children: [
                              Text("Edit",
                                  style: TextStyle(color: Colors.indigo)),
                              SizedBox(width: 5),
                              Icon(Icons.edit, color: Colors.indigo, size: 18)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
