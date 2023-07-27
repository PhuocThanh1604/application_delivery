import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
     print('Email ${email}');
    print('Password ${password}');
   if(isValiform(email,password)){
    Get.snackbar('not bar a valid form', 'Are u ready to send the HTTP requested?');
   }
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