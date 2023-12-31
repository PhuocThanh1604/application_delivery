import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/product.dart';

class ClientProductsDetailController extends GetxController {

  List<Product> selectedProducts = [];

  ClientProductsDetailController() {

  }
  void checkIfProductsWasAdded(Product product,var price, var counter){
    price.value = product.price ?? 0.0;

    if(GetStorage().read('shopping_bag')!=null){
      if(GetStorage().read('shopping_bag') is List<Product> ){
        selectedProducts = GetStorage().read('shopping_bag');
      }else{
        selectedProducts = Product.fromJsonList(GetStorage().read('shopping_bag'));
      }
      int  index= selectedProducts.indexWhere((p) => p.id ==product.id);

      if( index !=-1){
        counter.value = selectedProducts[index].quantity!;
        price.value =product.price! *counter.value;
        selectedProducts.forEach((p) {
          print('Product: ${p.toJson()}');

        }
        );
      }

    }
  }
  void addToBag(Product product,var price, var counter) {
    if(counter.value >0 ) {
      int index = selectedProducts.indexWhere((p) => p.id == product.id);

      if (index == -1) {
        if (product.quantity == null) {
          if(counter.value >0){
            product.quantity =counter.value;

          }else{
            product.quantity = 1;

          }
        }
        selectedProducts.add(product);
      } else {
        selectedProducts[index].quantity = counter.value;
      }
      GetStorage().write('shopping_bag', selectedProducts);
      Fluttertoast.showToast(msg: 'Add sucessfully');
    }
    else{
      Fluttertoast.showToast(msg: 'You must select at least one item to add');
    }
  }

  void addItem(Product product,var price, var counter) {
    counter.value = counter.value + 1;
    print('product:${product!.toJson()}');
    price.value = product.price! * counter.value;
  }

  void removeItem(Product product,var price, var counter) {
    if (counter.value > 1) {
      counter.value = counter.value - 1;
      print('product : ${product.toJson()}');
      price.value = product.price! * counter.value;
    }
  }
}
