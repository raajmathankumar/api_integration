import 'package:api_integration/service/apiService.dart';
import 'package:flutter/material.dart';

import 'card.dart';

import 'order_Screen.dart';

class ProductDetails extends StatefulWidget {
  static const routname = '/productDetails';
  int id;

  ProductDetails(this.id);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String get userid => 'Your Order';
  dynamic quantityCount = 0;
  dynamic total ;
  dynamic title = 'Title';
  dynamic price = 0;

  int get id => 1;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id}'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CardScreen(userid);
                }));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 500,
            child: FutureBuilder(
              future: ApiService().getsingleProduct(widget.id),
              builder: (context, AsyncSnapshot snapshot) {

                if (snapshot.hasData) {
                  //List products = snapshot.data;
                  return Container(
                    child: ListView(
                      children: [
                        Text('Title: ${snapshot.data['title']}'),
                        Text('Price: ${snapshot.data['price']}'),
                        Text('Rating: ${snapshot.data['rating']['rate']}'),
                        Text('Description:' + snapshot.data['description']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  print('hkk');
                                  setState(() {
                                    quantityCount--;
                                    total =
                                        snapshot.data['price'] * quantityCount;
                                  });
                                  print(
                                      'w${snapshot.data['price'] * quantityCount}');
                                },
                                icon: Icon(Icons.remove_circle_outlined)),
                            Text('$quantityCount'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    print('hi');
                                    quantityCount++;
                                    total =
                                        snapshot.data['price'] * quantityCount;
                                  });
                                  print(
                                      '${snapshot.data['price'] * quantityCount}');
                                },
                                icon: const Icon(Icons.add_box_outlined)),
                            Text('${total}',style: TextStyle(color: Colors.white70),),
                          ],
                        ),
                        Center(heightFactor: 2, child: Text('Total Amount')),
                        Center(heightFactor: 1, child: Text('${total}')),
                        BottomAppBar(
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content:
                                        Text('${quantityCount} - Item Added')));
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return OrderScreen(
                                      quantityCount, total, id, title, price);
                                }));
                              },
                              child: Text('ADD TO CART'),
                            ),
                          ),
                        )
/*
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
*/
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          /*  Container(
              margin: EdgeInsets.only(right: 20),
              child: Text('Total'))*/
        ],
      ),
    );
  }
}
