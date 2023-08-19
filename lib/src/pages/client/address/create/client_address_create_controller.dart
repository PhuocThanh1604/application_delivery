

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:udemy_flutter_delivery/src/pages/client/address/map/client_address_map_page.dart';
class ClientAddressCreateController extends GetxController {

  TextEditingController addressController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController refPointController = TextEditingController();

  void openGoogleMaps(BuildContext context){
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientAddressMapPage(),
      isDismissible: false,
      enableDrag: false

    );

  }

}