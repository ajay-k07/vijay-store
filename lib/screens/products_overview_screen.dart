import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/product_item.dart';
import '../providers/Products.dart';

enum FiltersOptions{
  Favorites,
  All,
}


class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<Products>(context);
    final products = _showOnlyFavorites ? ProductsData.fav : ProductsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Vijay Store'),
        actions: [
          PopupMenuButton(icon: Icon(Icons.more_vert),onSelected:(FiltersOptions selectedValue) {
            setState(() {
              if(selectedValue==FiltersOptions.Favorites){
               _showOnlyFavorites=true;
              }else{
                _showOnlyFavorites=false;
              }
            });
          } ,itemBuilder: (context) => [
            PopupMenuItem(child: Text('Only Favorites'),value: FiltersOptions.Favorites,),
            PopupMenuItem(child: Text('Show All'),value: FiltersOptions.All,),
          ],)
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.00),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          return  ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(
                // id: products[i].id,
                // tile: products[i].title,
                // imageUrl: products[i].imageUrl
          ),
          );
        },
      ),
    );
  }
}
