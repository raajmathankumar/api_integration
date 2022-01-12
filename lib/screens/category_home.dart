import 'package:api_integration/models/category_Model.dart';
import 'package:api_integration/service/apiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'category_product_Screen.dart';

class AllCategory extends StatelessWidget {
  static const routname = '/homePage';

  const AllCategory({Key? key}) : super(key: key);

  String get userid => 'Your Order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Sceen'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CardScreen(userid);
                }));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: FutureBuilder(
          future: ApiService().getAllCategory(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData)
            {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryProductScreen(snapshot.data[i])));
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Center(
                                child: Text(
                              snapshot.data[i].toString().toUpperCase(),
                              style: TextStyle(fontSize: 28),
                            )),
                            margin: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          color: Colors.white70,
                        ));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
