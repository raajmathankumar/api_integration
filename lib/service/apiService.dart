import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService{
  
  Future getAllCategory()async{
    final allCategory=Uri.parse('https://fakestoreapi.com/products/categories');
    final response =await http.get(allCategory);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
  Future getsingleProduct(int id)async{
    final singleProduct=Uri.parse('https://fakestoreapi.com/products/$id');
    final response =await http.get(singleProduct);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
  Future getProductByCategorey(String name)async{
    final productCategory=Uri.parse('https://fakestoreapi.com/products/category/$name');
    final response =await http.get(productCategory);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
  Future getSingleCarts(int id)async{
    final productCategory=Uri.parse('https://fakestoreapi.com/carts');
    final response =await http.get(productCategory);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future getcard(String userid)async{
    final productCategory=Uri.parse('https://fakestoreapi.com/carts/$userid');
    final response =await http.get(productCategory);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
  Future getDelete(String id) async {
    final deleteproduct=Uri.parse('https://fakestoreapi.com/carts/$id');
    final response =await http.delete(deleteproduct);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
}