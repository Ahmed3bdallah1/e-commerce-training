import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce_training/core/cubit/register/register_state.dart';
import 'package:e_commerce_training/core/network/remote/api_constants.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:e_commerce_training/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialStateRegister());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  UserModel? userModel;

  void userRegister( String name, String email,
      String phone, String nationalId, String password) {
    DioHelperStore.postData(url: ApiConstants.registerApi, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": "male",
      "nationalId": nationalId,
      "password": password,
      "profileImage": userImage
    }).then((value) {
      UserData.fromJson(value.data);
      print(value.data);
      // navigateAndFinishThisScreen(context, const HomeScreen());
      emit(DoneStateRegister(userModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorStateRegister(onError.toString()));
    });
  }

  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes!);
      print(userImage);
      emit(ChooseImageStateRegister());
    } else {
      emit(UploadErrorMessageRegisterState("there's no image selected"));
    }
  }
}
