


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/category.dart';
import 'package:udemy_flutter_delivery/src/providers/categories_provider.dart';

class ClientProductsListController extends GetxController{
  CategoriesProvider  categoriesProvider = CategoriesProvider();

  ClientProductsListController(){
    getCategories();
  }

  List<Category> categories = <Category>[].obs;
  void getCategories() async{
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }
}