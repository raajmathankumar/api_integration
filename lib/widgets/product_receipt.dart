
import 'package:api_integration/screens/add_To_Cart.dart';
import 'package:api_integration/screens/order_Screen.dart';
import 'package:flutter/material.dart';
typedef int TotalPriceCallBack(int value);

class ProductCard extends StatefulWidget {
final int id;
  final String title;
  final dynamic? price;
  final String? thumbnailUrl;
  ProductCard(
      this.id,
    this.title,
    this.price,
    this.thumbnailUrl,
  );

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  int quantityCount = 0;
  dynamic total = 0;
  dynamic price=0;
  dynamic title=' ';

  String? get thumbnailUrl => 'null';

  get id => 1;
 /* List<ProductState> _orders = [];

  List<ProductState> get orders {
    return _orders;
  }

  void addOrder(List<ProductState> cartProducts, Function total) {
    _orders.insert(0, ProductState(price: total));
    // notifyListeners();
  }*/
@override
  void initState() {
    // TODO: implement initState

print(quantityCount);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 List<ProductCard> cart = [];


    void increment() {
      setState(() {
        quantityCount++;
        title;
        print(quantityCount);
      });
    }

    void decrement() {
      print('lc');
      setState(() {

        quantityCount--;
        print(quantityCount);
      });
    }

    void totalAmount() {
      total = widget.price * quantityCount;
      setState(() {
        title;
        total;
        print(total);
      });
    }

var a=[0,0,0,0,0,0];

void addToCard(int quantityCount){

      a.add(quantityCount);
      print(quantityCount);
}

void totalPrice() {

          setState(() {
            total = widget.price * quantityCount;
          });
          print(total);
      return total;
    }

    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
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
                image: NetworkImage(widget.thumbnailUrl!),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 19, color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  decrement();
                                  totalAmount();
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                  size: 16,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.yellow),
                              child: quantityCount < 1
                                  ? Text(
                                      '${quantityCount = 0}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )
                                  : Text('${quantityCount}'),
                            ),
                            InkWell(
                                onTap: () {
                                  increment();
                                  totalAmount();
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.greenAccent,
                                  size: 16,
                                )),
                          ],
                        ),
                        Container(
                            color: Colors.yellowAccent,
                            child: total < 1
                                ? Text('${0.toStringAsFixed(0)}')
                                : Text('${total.toStringAsFixed(0)}')),
                        Row(
                          children: [
                            const Icon(
                              Icons.price_change,
                              color: Colors.red,
                              size: 18,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '${widget.price}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                    /*  Row(
                children: [
                  const Icon(
                    Icons.price_change,
                    color: Colors.red,
                    size: 18,
                  ),
                  const SizedBox(width: 7),
                  Text('${widget.price!}'),
                ],
              ),*/
                    ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        totalPrice();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return OrderScreen(
                                  quantityCount, total, id, title, price);
                            }));
                        //addToCard(quantityCount);

                        //addToCard(title, price, total, quantityCount)
                       // addToCard(title, price, total, quantityCount);
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.yellowAccent,
                        size: 30,
                      )),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
