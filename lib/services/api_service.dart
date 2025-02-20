import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_challenge/models/item_model.dart';

class ApiService {
  //agregar un archivo para url
  final String _baseUrl="https://jsonplaceholder.typicode.com/posts";

  //ver cambiar un try catch en lugar de if
  Future<List<ItemModel>> obtainItems(int page, {int limit=10}) async {
    final response=await http.get(Uri.parse('$_baseUrl?_page=$page&_limit=$limit'));
    if(response.statusCode==200){
      List jsonResponse=json.decode(response.body);
      return jsonResponse.map((item)=>ItemModel.fromJson(item)).toList();
    }
    else{
      throw Exception("Fallo al cargar la lista de items");
    }
  }

  Future<ItemModel> itemDetails(int id)async {
    final response=await http.get(Uri.parse('$_baseUrl/$id'));
    if(response.statusCode==200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Fallo al cargar los datos del item");
    }
  }
}