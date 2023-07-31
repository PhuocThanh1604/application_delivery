


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientHomeController extends GetxController{
  // var helloWorld = 'Chào Cả Thế Gioi'.obs;
  // void changeVar(){
  //   helloWorld.value ='GOOD BYE';
  // } // test


  var indexTab =0.obs;
  void changeTab(int index){
    indexTab.value= index;
  }
  void signOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);//Xóa lịch sử màn hình
  }
}