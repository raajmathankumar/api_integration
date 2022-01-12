import 'package:api_integration/service/apiService.dart';
import 'package:api_integration/screens/product_Details.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  static const routname = '/cardScreen';
  String userid;

  CardScreen(this.userid);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late final ApiService apiService;

  @override
  void initState() {
    // TODO: implement initState
    apiService = ApiService();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.userid.toUpperCase()),
          /* actions: [Column(
        children: [
          Text('total amount'),
          Text('1000')
        ],
      )],*/
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 250,
              child: FutureBuilder(
                future: ApiService().getcard('1'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    List products = snapshot.data['products'];
                    return ListView.builder(
                        itemCount: products.length.compareTo(0),
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                              future: ApiService().getsingleProduct(
                                  products[index]['productId']),
                              builder: (context, AsyncSnapshot snapshot) {
                                double total = 0;
                                products.forEach((element) {
                                  total = snapshot.data['price'] *
                                      products[index]['quantity'];
                                });
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title:
                                            Text('${snapshot.data['title']}'),
                                        leading: Image.network(
                                            snapshot.data['image']),
                                        subtitle: Text("Quantity- " +
                                            products[index]['quantity']
                                                .toString()),
                                        trailing: Text('${total}'),
                                      ),
                                    ].toList(),
                                  );
                                } else {
                                  return LinearProgressIndicator();
                                }
                              });
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            /*  Container(
              margin: EdgeInsets.only(right: 20),
              child: Text('Total'))*/
           /* IconButton(icon: Icon(Icons.delete), onPressed: () {
              ApiService api=ApiService();
              api.getDelete(widget.userid);
            },),*/
          ],
        )
    );
  }
}
