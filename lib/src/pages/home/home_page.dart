import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/home/home_controller.dart';


class HomePage extends StatelessWidget {
  HomeController con = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
