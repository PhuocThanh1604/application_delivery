import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:udemy_flutter_delivery/src/models/product.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/providers/categories_provider.dart';
import 'package:udemy_flutter_delivery/src/models/category.dart';
import 'package:udemy_flutter_delivery/src/providers/products_provider.dart';

class RestaurantProductsCreateController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  CategoriesProvider categoriesProvider = CategoriesProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile1;
  File? imageFile2;
  File? imageFile3;

  var idCategory = ''.obs;
  List<Category> categories = <Category>[].obs;
  ProductsProvider productsProvider = ProductsProvider();
  RestaurantProductsCreateController() {
    getCategories();
  }

  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }

  void createProduct(BuildContext context) async {
    String name = nameController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    print('name ${name}');
    print('description ${description}');
    print('price ${price}');
    print('id category ${idCategory}');
    ProgressDialog progressDialog = ProgressDialog(context: context);
    if (isValiForm(name, description, price)) {
     Product product = Product(
       name:name,
       description :description,
       price: double.parse(price),
         idCategory: idCategory.value
     );
     progressDialog.show(max:100,msg: "Loading....");

     List<File> images = [];
     images.add(imageFile1!);
     images.add(imageFile2!);
     images.add(imageFile3!);
     Stream stream = await productsProvider.create(product, images);
     stream.listen((res) {
       progressDialog.close();
       ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
       Get.snackbar('Process Fishned',responseApi.message??'');

       if(responseApi.success == true){
         clearForm();
       }
     });
    }
  }

  bool isValiForm(String name, String description, String price) {
    if (name.isEmpty) {
      Get.snackbar('Form not valid', 'Enter name for product');
      return false;
    }
    if (description.isEmpty) {
      Get.snackbar('Form not valid', 'Enter description for product');
      return false;
    }
    if (price.isEmpty) {
      Get.snackbar('Form not valid', 'Enter price for product');
      return false;
    }
    if (idCategory.value == '') {
      Get.snackbar('Form not valid', 'Enter categories for product');
      return false;
    }
    if (imageFile1 == null) {
      Get.snackbar('Form not valid', 'Select image 1  for product');
      return false;
    }
    if (imageFile2 == null) {
      Get.snackbar('Form not valid', 'Select image 2  for product');
      return false;
    }
    if (imageFile3 == null) {
      Get.snackbar('Form not valid', 'Select image 3  for product');
      return false;
    }

    return true;
  }

  void clearForm() {
    nameController.text = '';
    descriptionController.text = '';
    priceController.text = '';
    imageFile1 = null;
    imageFile2 = null;
    imageFile3 = null;
    idCategory.value = '';
    update();
  }

  Future selectImage(ImageSource imageSource, int numberFile) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      if (numberFile == 1) {
        imageFile1 = File(image.path);
      } else if (numberFile == 2) {
        imageFile2 = File(image.path);
      } else if (numberFile == 3) {
        imageFile3 = File(image.path);
      }
      update();
    }
  }

  void showAlerDialog(BuildContext context, int numberFile) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery, numberFile);
        },
        child: Text(
          'Phòng trưng bày',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera, numberFile);
        },
        child: Text(
          'Camera',
          style: TextStyle(color: Colors.black),
        ));
    AlertDialog alertDialog = AlertDialog(
      title: Text('chọn một tùy chọn'),
      actions: [galleryButton, cameraButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
