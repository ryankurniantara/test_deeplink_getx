import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = true;
  runApp(MyApp(
    isLoggedin: isLoggedIn,
  ));
}

class MyApp extends StatefulWidget {
  final bool isLoggedin;
  const MyApp({super.key, required this.isLoggedin});

  @override
  State<MyApp> createState() => _MyAppState();
}

// **
// ** Isue : Ketika aplikasi di terminated, deep link selalu membuka route "/" ,
// ** yg mana "/" saya definisikan sebagai route home, bagaimana jika dia masih dalam kedaan blum login,
// ** yang mana route login memiliki "/login" sebagai route nya. jadi kalau orang yg belum login,
// ** ketika dia klik deep link pada saat kondisi pertama kali mati, dia selalu memangil route "/"
// ** yang mana itu adalah route home

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Test Deep Linking",
      initialRoute: widget.isLoggedin ? AppPages.INITIAL : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
