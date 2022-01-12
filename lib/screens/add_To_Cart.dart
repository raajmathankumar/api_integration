import 'package:api_integration/widgets/product_receipt.dart';
import 'package:flutter/material.dart';
class AddToCard extends StatelessWidget {
 late final List<ProductCard>product;
 AddToCard(this.product);
  @override
  Widget build(BuildContext context) {
    if(product.isEmpty){
      return Center(
        child: Text('You have no favourite yet'),
      ) ;
    }else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: product[index].price,
            title: Text(product[index].title),
            subtitle: product[index].price,
          );
        },
        itemCount: product.length,
      );
    }
  }


}

