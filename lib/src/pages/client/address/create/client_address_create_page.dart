import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/address/create/client_address_create_controller.dart';

class ClientAddressCreatePage extends StatelessWidget {
  ClientAddressCreateController con = Get.put(ClientAddressCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR ELEMEMTOS UNO DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewAddress(context),
          _iconBack()
        ],
      ),
    );
  }

  Widget _iconBack() {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios,size: 30,)),
        ));
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
            _textFieldAddress(),
            _textFieldNeighborhood(),
            _textFieldRefPoint(context),
            SizedBox(
              height: 20,
            ),
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

  Widget _textFieldAddress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.addressController,
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration: InputDecoration(
            hintText: 'Direction', prefixIcon: Icon(Icons.location_on)),
      ),
    );
  }

  Widget _textFieldNeighborhood() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.neighborhoodController,
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration: InputDecoration(
            hintText: 'Neighborhood', prefixIcon: Icon(Icons.location_city)),
      ),
    );
  }

  Widget _textFieldRefPoint(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        onTap: () => con.openGoogleMaps(context),
        controller: con.neighborhoodController,
        autofocus: false,
        focusNode: AlwayDisabledFocusNode(),
        keyboardType: TextInputType.text,
        obscureText: false,
        decoration: InputDecoration(
            hintText: 'Reference point',
            prefixIcon: Icon(Icons.map)),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child:
              Text('Create direction', style: TextStyle(color: Colors.black))),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _textNewAddress(BuildContext context) {
    //SET STATE = CTRL+S

    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 25),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Icon(Icons.location_on, size: 100),
              Text(
                'New Direction',
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

class AlwayDisabledFocusNode extends FocusNode{
  @override
  bool get hasFocus => false;

}
