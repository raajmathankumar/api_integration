import 'package:flutter/material.dart';
class OrderScreen extends StatefulWidget {
  dynamic quantityCount;
  dynamic total;
  dynamic id;
  dynamic title;
  dynamic price;
  @override
  State<OrderScreen> createState() => _OrderScreenState();

  OrderScreen(this.quantityCount, this.total, this.id, this.title,this.price, {Key? key}) : super(key: key);
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add To Cart'),),
      body: Container(
        child:ListTile(

          title:  Text('Total: ${widget.title}'),
          subtitle:  Text('Quantity: ${widget.quantityCount}'),
          trailing: Column(
            children: [
              Text('Price'),
              Text('${widget.total}')
            ],
          )
        )
      ),
    );
  }
}
