import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/product_item.dart';
import '../providers/Products.dart';


class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final loadedProducts = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Vijay Store'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.00),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) {
          return ProductItem(
              id: loadedProducts[i].id,
              tile: loadedProducts[i].title,
              imageUrl: loadedProducts[i].imageUrl);
        },
      ),
    );
  }
}
