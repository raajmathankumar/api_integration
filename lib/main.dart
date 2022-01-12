
import 'package:api_integration/screens/Login_Page.dart';
import 'package:api_integration/screens/category_product_Screen.dart';
import 'package:api_integration/service/apiService.dart';
import 'package:api_integration/screens/product_Details.dart';
import 'package:flutter/material.dart';

import 'screens/category_home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int id=0;
    String catName='';
    //final api=ApiService();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllCategory(),
      routes: {
        CategoryProductScreen.routname:(context)=>CategoryProductScreen(catName),
        ProductDetails.routname:(context)=>ProductDetails(id),
        AllCategory.routname:(context)=>AllCategory(),
        LoginPage.routname:(context)=>LoginPage(),

      },
    );
  }
}
