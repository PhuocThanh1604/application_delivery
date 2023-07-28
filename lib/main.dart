import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:udemy_flutter_delivery/src/pages/home/home_page.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_page.dart';
import 'package:udemy_flutter_delivery/src/pages/resgister/register_page.dart';
User userSession = User.fromJson(GetStorage().read('user')??{});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initSate() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    print('Usuario id:${userSession.id}');
    return GetMaterialApp(
      title: 'Delivery Udemy',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ?'/home': '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => ResgisterPage()),
        GetPage(name: '/home', page: () => HomePage())
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              primary: Colors.amber,
              secondary: Colors.amberAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
