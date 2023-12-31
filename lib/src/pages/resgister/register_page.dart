import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/resgister/register_controller.dart';

class ResgisterPage extends StatelessWidget {
  RegisterController con = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR ELEMEMTOS UNO DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context),
          _buttonBack()
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
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
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
      ),
    ));
  }

  Widget _TextYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 30),
        child: Text('YOUR INFORMATION', style: TextStyle(color: Colors.black)));
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        decoration:
            InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email)),
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
            InputDecoration(hintText: 'Name', prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.lastNameController,
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration: InputDecoration(
            hintText: 'Last Name', prefixIcon: Icon(Icons.person_2_outlined)),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        obscureText: false,
        decoration:
            InputDecoration(hintText: 'Phone', prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirm Password', prefixIcon: Icon(Icons.lock_outline)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration:
            InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: () {
            con.register(context);
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text('REGISTER', style: TextStyle(color: Colors.black))),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _imageUser(BuildContext context) {
    //SET STATE = CTRL+S


    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () =>con.showAlerDialog(context),
          child: GetBuilder<RegisterController>(
            builder: (value) => CircleAvatar(
              backgroundImage:con.imageFile !=null
                  ?  FileImage(con.imageFile!)
                  : AssetImage('assets/img/user_profile.png') as ImageProvider,
              radius: 60,
              backgroundColor: Colors.white,
            ),
          )
        ),
      ),
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
