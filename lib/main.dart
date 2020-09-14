import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/Products.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
     builder:(ctx)=>Products(),
      child: MaterialApp(
        title: 'Vijay Store',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         routes: {
          '/': (ctx)=> ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx)=> ProductDetailScreen(),

         },

      ),
    );
  }
}
