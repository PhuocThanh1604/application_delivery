import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/providers/categories_provider.dart';
import 'package:udemy_flutter_delivery/src/models/category.dart';

class RestaurantCategoriesCreateController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoriesProvider categoriesProvider = CategoriesProvider();

  void createCategory() async {
    String name = nameController.text;
    String description = descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      Category category = Category(name: name, description: description);

      ResponseApi responseApi = await categoriesProvider.create(category);
      Get.snackbar("finished process", responseApi.message ?? '');
      if (responseApi.success == true) {
        clearForm();
      }
    } else {
      Get.snackbar(
          "invalid form", ' Enter all the fields to create the categories');
    }
  }

  void clearForm() {
    nameController.text = '';
    descriptionController.text = '';
  }
}
