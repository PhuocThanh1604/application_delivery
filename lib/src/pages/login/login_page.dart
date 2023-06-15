import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: _textDontHaveAccount(),
        ),
        body: Stack(
          //POSICIONAR ELEMEMTOS UNO DEL OTRO
          children: [
            _backgroundCover(context),
            Column(
              //POSICIONAR ELEMEMTOS UNO DEL OTRO (VERTICAL)
              children: [_imageCover(), _textAppName()],
            )
          ],
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
    );
  }

  Widget _textAppName() {
    return Text(
      'DELIVERY MYSQL',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      // Horizontal
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have account',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(width: 7),
        Text(
          'Registrate Account',
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17),
        )
      ],
    );
  }

//Private
  Widget _imageCover() {
    return SafeArea(
      // chỉnh cho img k vượt quá khung hình
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/img/delivery.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}
