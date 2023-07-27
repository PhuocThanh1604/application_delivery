import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:udemy_flutter_delivery/src/providers/user_provider.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmpassword = confirmPasswordController.text.trim();
    print('Email ${email}');
    print('Password ${password}');
    if (isValiform(email, name, lastname, phone, password, confirmpassword)) {
      User user = User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password,
      );

      try {
        Response response = await usersProvider.create(user);
        print('Response: ${response.body}');
        Get.snackbar('Success', 'User registered successfully!');
      } catch (e) {
        print('Error during registration: $e');
        Get.snackbar('Error', 'An error occurred during registration. Please try again later.');
      }
    }
  }

  bool isValiform(String email, String name, String lastname, String phone,
      String confirmPassword, String password) {
    if (email.isEmpty) {
      Get.snackbar('Error no value', 'Please enter email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error no value', 'Please enter a valid email');
      return false;
    }
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
    if (password.isEmpty) {
      Get.snackbar('Error no value', 'Please enter password');
      return false;
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('Error no value', 'Please enter confirmpassword');
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return false;
    }
    return true;
  }
}
