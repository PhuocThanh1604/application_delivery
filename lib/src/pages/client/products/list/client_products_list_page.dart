import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:udemy_flutter_delivery/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:udemy_flutter_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/pages/resgister/register_page.dart';
import 'package:udemy_flutter_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:udemy_flutter_delivery/src/utils/custom_animated_bottom_bar.dart';



class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController con = Get.put(ClientProductsListController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: con.categories.length,
      child: Scaffold(

          body: TabBarView(

          ),
      ),
    );
  }


}
