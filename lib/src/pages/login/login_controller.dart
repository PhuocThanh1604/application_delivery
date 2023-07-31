import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:udemy_flutter_delivery/src/providers/user_provider.dart';

class LoginController extends GetxController{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User user = User.fromJson(GetStorage().read('user') ?? {});

  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
     print('Email ${email}');
    print('Password ${password}');
    if (isValidForm(email, password)) {

      ResponseApi responseApi = await usersProvider.login(email, password);

      print('Response Api: ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage().write('user', responseApi.data); // DATOS DEL USUARIO EN SESION
        User myUser = User.fromJson(GetStorage().read('user') ?? {});

        print('Roles length: ${myUser.roles!.length}');

        if (myUser.roles!.length > 1) {
          goToRolesPage();
        }
        else { // SOLO UN ROL
          goToClientHomePage();
        }

      }
      else {
        Get.snackbar('Login Error', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  // Get.toNamed('/home');
}

    void goToClientHomePage() {
      Get.offNamedUntil('/client/home', (route) => false);
    }

    void goToRolesPage() {
      Get.offNamedUntil('/roles', (route) => false);
    }
  bool isValidForm(String email, String password){

    if(email.isEmpty){
      Get.snackbar('Error no value', 'Please enter email');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('error no value', 'Enter email again');
    }
    if(password.isEmpty){
      Get.snackbar('Error no value', 'Please enter password');
      return false;
    }
    return true;
  }
}