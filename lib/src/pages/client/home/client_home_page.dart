import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/home/client_home_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_page.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/profile/info/client_profile_info_page.dart';

import 'package:udemy_flutter_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/pages/resgister/register_page.dart';
import 'package:udemy_flutter_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/utils/custom_animated_bottom_bar.dart';



class ClientHomePage extends StatelessWidget {

  ClientHomeController con = Get.put(ClientHomeController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx(()=>IndexedStack(
        index: con.indexTab.value,
        children: [
          ClientProductsListPage(),
          DeliveryOrdersListPage(),
          ClientProfileInfoPage(),
        ],
      ))
    );
  }
  
  Widget _bottomBar()
  {
    return Obx(()=> CustomAnimatedBottomBar (
      containerHeight: 70,
      backgroundColor: Colors.amber,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      selectedIndex: con.indexTab.value,
      onItemSelected: (index) => con.changeTab(index),
      items:[
        BottomNavyBarItem(icon: Icon(Icons.apps), title: Text('Products'),activeColor: Colors.white),
        BottomNavyBarItem(icon: Icon(Icons.list), title: Text('My orders'),activeColor: Colors.white,inactiveColor: Colors.black),
        BottomNavyBarItem(icon: Icon(Icons.person), title: Text('Profile'),activeColor: Colors.white,inactiveColor: Colors.black)
      ]
    )
    );
  }

}
