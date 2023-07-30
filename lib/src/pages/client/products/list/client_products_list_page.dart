import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/pages/resgister/register_page.dart';
import 'package:udemy_flutter_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/utils/custom_animated_bottom_bar.dart';

// class ClientProductsListPage extends StatefulWidget {
//   const ClientProductsListPage({super.key});
//
//   @override
//   State<ClientProductsListPage> createState() => _ClientProductsListPageState();
// }
//
// class _ClientProductsListPageState extends State<ClientProductsListPage> {
//   String helloWorld = 'CHÀO THẾ GIỚI';
//
//   //Set STATE
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//         children: [Text(helloWorld),
//             ElevatedButton(
//               onPressed: () {// QUẢN LÝ TÌNH TRẠNG
//                 setState(() {
//                   helloWorld= 'GOOD BYE';
//                 });
//               },
//               child:Text('Thay đổi',
//                 style: TextStyle(
//                     color: Colors.black
//                 ),
//               ),
//
//             ),
//         ],
//         ),
//       ),
//     );
//   }
// }
//


class ClientProductsListPage extends StatelessWidget {

  ClientProductsListController con = Get.put(ClientProductsListController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx(()=>IndexedStack(
        index: con.indexTab.value,
        children: [
          RestaurantOrdersListPage(),
          DeliveryOrdersListPage(),
          ResgisterPage()
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
        BottomNavyBarItem(icon: Icon(Icons.apps), title: Text('Home'),activeColor: Colors.white),
        BottomNavyBarItem(icon: Icon(Icons.list), title: Text('My orders'),activeColor: Colors.white,inactiveColor: Colors.black),
        BottomNavyBarItem(icon: Icon(Icons.person), title: Text('Profile'),activeColor: Colors.white,inactiveColor: Colors.black)
      ]
    )
    );
  }

}
