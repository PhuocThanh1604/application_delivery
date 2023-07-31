import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:udemy_flutter_delivery/src/providers/user_provider.dart';

import '../info/client_profile_info_controller.dart';


class ClientProfileUpdateController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  UsersProvider usersProvider = UsersProvider();


  ClientProfileInfoController clientProfileInfoController =  Get.find();

  ClientProfileUpdateController() {
    nameController.text = user.name ?? '';
    lastNameController.text = user.lastname ?? '';
    phoneController.text = user.phone ?? '';
  }

  void updateInfo(BuildContext context) async {
    String name = nameController.text;
    String lastname = lastNameController.text;
    String phone = phoneController.text;


    if (isValiform( name, lastname, phone)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'updated data...');
      User myUser = User(
          id: user.id,
          name: name,
          lastname: lastname,
          phone: phone,
          sessionToken: user.sessionToken
      );
      if (imageFile == null) {
        ResponseApi responseApi = await usersProvider.update(myUser);
        print('Response Api Update: ${responseApi.data}');
        Get.snackbar('Proceso terminado', responseApi.message ?? '');
        progressDialog.close();
        if (responseApi.success == true) {
          GetStorage().write('user', responseApi.data);
          clientProfileInfoController.user.value = User.fromJson(GetStorage().read('user')??{});
        }
      }
      else {
        Stream stream = await usersProvider.updateWithImage(myUser, imageFile!);
        stream.listen((res) {
          progressDialog.close(); //dùng để loading chờ đợi
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
          Get.snackbar('finished process', responseApi.message ?? '');
          print('Response Api Update: ${responseApi.data}');
          if (responseApi.success == true) {
            GetStorage().write('user', responseApi.data);
            clientProfileInfoController.user.value = User.fromJson(responseApi.data);
          } else {
            Get.snackbar('update failed', responseApi.message ?? '');
          }
        });
      }
      // Stream stream = await usersProvider.createWithImage(user, imageFile!);
      // stream.listen((res) {
      //   progressDialog.close(); //dùng để loading chờ đợi
      //   ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
      //   if (responseApi.success == true) {
      //     GetStorage().write('user', responseApi.data);
      //     goToHomePage();
      //   } else {
      //     Get.snackbar('Register fallido', responseApi.message ?? '');
      //   }
      // });

    }
  }

  bool isValiform(
    String name,
    String lastname,
    String phone
  ) {
    if (name.isEmpty) {
      Get.snackbar('Error no value', 'Please enter name');
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar('Error no value', 'Please enter lastname');
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar('Error no value', 'Please enter phone');
      return false;
    }

    return true;
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlerDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text(
          'Phòng trưng bày',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text(
          'Camera',
          style: TextStyle(color: Colors.black),
        ));
    AlertDialog alertDialog = AlertDialog(
      title: Text('chọn một tùy chọn'),
      actions: [galleryButton, cameraButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
