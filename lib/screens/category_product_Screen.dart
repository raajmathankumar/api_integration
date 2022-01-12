import 'package:api_integration/service/apiService.dart';
import 'package:api_integration/screens/product_Details.dart';
import 'package:api_integration/widgets/product_receipt.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class CategoryProductScreen extends StatefulWidget {
  static const routname = '/categoryProductScreen';
  String catName;

  CategoryProductScreen(this.catName);

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  String get userid => 'Your Order';

  /*dynamic quantityCount = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  var total = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  dynamic id = 0;
  dynamic title = 'j';
  dynamic price = 0;
 var quantityList = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];*/

/*  dynamic quantityCount = 0;
  dynamic total = 0;
  dynamic price=100;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catName.toUpperCase()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CardScreen(userid);
                }));
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CardScreen(userid);
                }));
              },
              icon: Icon(Icons.card_giftcard)),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getProductByCategorey(widget.catName),
          builder: (context, AsyncSnapshot snapshot) {
            /*     void increment() {
              // snapshot.data[0]['productId']['quantity:1']++;
              // print('${snapshot.data['productId']['quantity']++}');
              setState(() {
                quantityCount++;
                print(quantityCount);
              });

              print(quantityCount);
            }

            void decrement() {
              print('lc');
              setState(() {
                quantityCount--;
              });
              print(quantityCount);
            }

            void totalPrice() {
              setState(() {
                total = (snapshot.data['price'])* (quantityCount);
              });
              print(total);
              return total;
            }*/
            // List<dynamic> products = snapshot.data['category'];
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          print(snapshot.data[i]['id']);
                          return ProductDetails(snapshot.data[i]['id']);
                        }));
                      },
                      child: ProductCard(snapshot.data[i]['id'],snapshot.data[i]['title'],
                          snapshot.data[i]['price'], snapshot.data[i]['image'])
                      /*Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(
                              0.0,
                              10.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: -6.0,
                          ),
                        ],
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.35),
                            BlendMode.multiply,
                          ),
                          image: NetworkImage(snapshot.data[i]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                               // quantityList[i] += 1;
                                snapshot.data[i]['title'],
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.white70),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantityCount[i]--;
                                          total[i] = snapshot.data[i]['price'] * quantityCount[i];
                                        });
                                        print(
                                            '${snapshot.data[i]['price'] * quantityCount[i]}');
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outlined,
                                        color: Colors.red,
                                      )),
                                  Text(
                                    '${quantityCount[i]}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantityCount[i]++;
                                          total[i] = snapshot.data[i]['price'] *
                                              quantityCount[i];
                                        });
                                        print(
                                            '${snapshot.data[i]['price'] * quantityCount[i]}');
                                      },
                                      icon: const Icon(
                                        Icons.add_box_outlined,
                                        color: Colors.greenAccent,
                                      )),
                                  Container(color:Colors.white70,child: Text('${total[i]}')),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            '${quantityCount[i]} - Item Added')));
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return OrderScreen(quantityCount, total,
                                          id, title, price);
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.yellowAccent,
                                  ))),

                        ],
                      ),
                    ),*/
                      /* ListTile(
                      leading: Image.network(snapshot.data[i]['image']),
                      title: Text(snapshot.data[i]['title']),
                      subtitle: Text('${snapshot.data[i]['price']}'),
                    ),*/
                      );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
