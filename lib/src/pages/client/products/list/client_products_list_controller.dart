


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/src/material/bottom_sheet.dart' show ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_bottom_sheet/src/bottom_sheet_route.dart';
import 'package:udemy_flutter_delivery/src/models/category.dart';
import 'package:udemy_flutter_delivery/src/models/product.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/detail/client_products_detail_page.dart';
import 'package:udemy_flutter_delivery/src/providers/categories_provider.dart';
import 'package:udemy_flutter_delivery/src/providers/products_provider.dart';
class ClientProductsListController extends GetxController{
  CategoriesProvider categoriesProvider = CategoriesProvider();

  ProductsProvider productsProvider = ProductsProvider();
  List<Category> categories = <Category>[].obs;


  ClientProductsListController(){
    getCategories();
  }


  void getCategories() async {
    var result = await categoriesProvider.getAll();
    print('categories all ${result}');
    categories.clear();
    categories.addAll(result);
  }

  Future<List<Product>> getProducts(String idCategory) async{
    return await productsProvider.findByCategory(idCategory);
  }

  void openBottomSheet(BuildContext context, Product product) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientProductsDetailPage(product: product,),
    );
  }
}