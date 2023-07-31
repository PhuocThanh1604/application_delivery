import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/client/profile/info/client_profile_info_controller.dart';

class ClientProfileInfoPage extends StatelessWidget {
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> Stack( //Obx loading data
        //POSICIONAR ELEMEMTOS UNO DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context),
          _buttonSignOut()
        ],
      ),
    )
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _TextName(),
            _TextEmail(),
            _TextPhone(),
            _buttonUpdate(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
          onPressed: () =>con.goToProfileUpdate(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child:
              Text('CẬP NHẬT DỮ LIỆU', style: TextStyle(color: Colors.black))),
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
        child: CircleAvatar(
          backgroundImage: con.user.value.image != null
              ? NetworkImage(con.user.value.image!)
              : AssetImage('assets/img/user_profile.png') as ImageProvider,
          radius: 60,
          backgroundColor: Colors.white,
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

  Widget _TextName() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('${con.user.value.name ?? ''}${con.user.value.lastname ?? ''}'),
        subtitle: Text('User name'),
      ),
    );
  }

  Widget _TextEmail() {
    return ListTile(
      leading: Icon(Icons.email),
      title: Text(con.user.value.email ?? ''),
      subtitle: Text('Email'),
    );
  }

  Widget _TextPhone() {
    return ListTile(
      leading: Icon(Icons.phone),
      title: Text(con.user.value.phone ?? ''),
      subtitle: Text('Telephone'),
    );
  }

  Widget _buttonSignOut() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(right: 20),
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => con.signOut(),
        icon: Icon(Icons.power_settings_new, color: Colors.white, size: 30),
      ),
    ));
  }
}
