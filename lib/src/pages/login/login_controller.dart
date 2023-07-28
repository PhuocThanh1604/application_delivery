import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/providers/user_provider.dart';

class LoginController extends GetxController{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
     print('Email ${email}');
    print('Password ${password}');
   if(isValiform(email,password)){

     ResponseApi responseApi = await usersProvider.login(email, password);
     print('Response Api : ${responseApi.toJson()}');
     if (responseApi.success==true){
       GetStorage().write('user', responseApi.data);
       goToHomePage();
       // Get.snackbar("Login Successfully", responseApi.message ??'');
     }else{
       Get.snackbar("Login failed", responseApi.message??'');
     }
   }
  }

  void goToHomePage() {
  Get.toNamed('/home');
}
  bool isValiform(String email, String password){

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