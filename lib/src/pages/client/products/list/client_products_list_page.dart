import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/client/profile/info/client_profile_info_page.dart';
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

        body: Center(child: Text('CLIENT PRODUCTS LIST')),
    );
  }


}
