
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/address/list/client_address_list_controller.dart';

class ClientAddressListPage extends StatelessWidget {

  ClientAddressListController con = Get.put(ClientAddressListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text('My Addresses',
        style: TextStyle(
          color: Colors.black
        ),
        ),
        actions: [
          _iconAddressCreate()
        ],
      ),
    );
  }

  Widget _iconAddressCreate(){
    return IconButton(onPressed:()=> con.goToAddressCreate(), icon: Icon(
      Icons.add,color: Colors.black,
    )
    );
  }
}
