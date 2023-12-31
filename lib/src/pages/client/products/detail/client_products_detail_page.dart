import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/product.dart';
import 'package:udemy_flutter_delivery/src/pages/client/products/detail/client_products_detail_controller.dart';

class ClientProductsDetailPage extends StatelessWidget {
  Product? product;
  late ClientProductsDetailController con;
  var counter = 0.obs;
  var price = 0.0.obs;

  ClientProductsDetailPage({@required this.product}) {
    con = Get.put(ClientProductsDetailController());
  }

  @override
  Widget build(BuildContext context) {
    con.checkIfProductsWasAdded(product!, price, counter);
    return Obx(() => Scaffold(
        bottomNavigationBar: Container(height: 100, child: _buttonsAddToBag()),
        body: Column(
          children: [
            _imageSlidershow(context),
            _textNameProduct(),
            _textDescriptionProduct(),
            _texPriceProduct()
          ],
        )));
  }

  Widget _textNameProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Text(
        product?.name ?? '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _textDescriptionProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Text(
        product?.description ?? '',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _texPriceProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 15, left: 30, right: 30),
      child: Text(
        '\$ ${product?.price.toString() ?? ''}',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buttonsAddToBag() {
    return Column(
      children: [
        Divider(
          height: 1,
          color: Colors.grey[400],
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 25),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => con.removeItem(product!,price,counter),
                child: Text(
                  '-',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25)))),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '${counter.value}',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, minimumSize: Size(40, 37)),
              ),
              ElevatedButton(
                onPressed: () => con.addItem(product!,price,counter),
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25)))),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => con.addToBag(product!,price,counter),
                child: Text(
                  'Add Product \$${price.value}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _imageSlidershow(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        ImageSlideshow(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            initialPage: 0,
            indicatorColor: Colors.amber,
            indicatorBackgroundColor: Colors.grey,
            children: [
              FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 50),
                  placeholder: AssetImage('assets/img/no-image.png'),
                  image: product!.image1 != null
                      ? NetworkImage(product!.image1!)
                      : AssetImage('assets/img/no-image.png') as ImageProvider),
              FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 50),
                  placeholder: AssetImage('assets/img/no-image.png'),
                  image: product!.image2 != null
                      ? NetworkImage(product!.image2!)
                      : AssetImage('assets/img/no-image.png') as ImageProvider),
              FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 50),
                  placeholder: AssetImage('assets/img/no-image.png'),
                  image: product!.image3 != null
                      ? NetworkImage(product!.image3!)
                      : AssetImage('assets/img/no-image.png') as ImageProvider),
            ])
      ],
    ));
  }
}
