import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/restaurant/categories/create/restaurant_categories_create_controller.dart';

class RestaurantCategoriesCreatePage extends StatelessWidget {
 RestaurantCategoriesCreateController con = Get.put(RestaurantCategoriesCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR ELEMEMTOS UNO DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewCategory(context),
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.43,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _TextYourInfo(),
            _textFieldName(),
            _textFieldDescription(),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  Widget _TextYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 30),
        child: Text('YOUR INFORMATION', style: TextStyle(color: Colors.black)));
  }

  Widget _textFieldDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: con.descriptionController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        obscureText: false,
        decoration: InputDecoration(
            hintText: 'Description',
            prefixIcon: Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Icon(Icons.description))),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
         controller: con.nameController,
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration:
            InputDecoration(hintText: 'Name', prefixIcon: Icon(Icons.category)),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: () => {con.createCategory()},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text('Update', style: TextStyle(color: Colors.black))),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _textNewCategory(BuildContext context) {
    //SET STATE = CTRL+S

    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 25),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Icon(Icons.category, size: 100),
              Text(
                'New Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ],
          )),
    );
  }

  Widget _textAppName() {
    return Text(
      'DELIVERY MYSQL',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
