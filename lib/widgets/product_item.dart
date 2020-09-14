import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import 'package:vijay_store/screens/product_detail_screen.dart';
import '../providers/Products.dart';
class ProductItem extends StatelessWidget {
  // final String id;
  // final String tile;
  // final String imageUrl;
  //
  // ProductItem({this.id, this.tile, this.imageUrl});

  void gotoProductDetail(context,id) {
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final product =Provider.of<Product>(context);
    return GestureDetector(
      onTap:()=> gotoProductDetail(context,product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          footer: GridTileBar(
            leading: IconButton(

              icon: Icon(product.isFavorite ? Icons.favorite: Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: null),
          ),
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }


}
