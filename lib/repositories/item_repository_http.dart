import 'dart:convert';
import 'package:flutter_challenge/repositories/item_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ItemRepositoryHttp implements ItemRepository{

  final String baseUrl = dotenv.env['API_URL'] ?? '';

  //get to obtain the detail of an item
  @override
  Future<ItemModel> getItemDetails(int id) async{
    final response=await http.get(Uri.parse('$baseUrl/$id'));
    if(response.statusCode==200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Fallo al cargar los datos del item");
    }
  }

  //get to obtain the list with the pagination and searchItem
  @override
  Future<List<ItemModel>> getItemsList(int page, {int limit=20,String? searchItem}) async{
    final response=await http.get(Uri.parse('$baseUrl?_page=$page&_limit=$limit${searchItem!=null?'&title=$searchItem':''}'));
    if(response.statusCode==200){
      List jsonResponse=json.decode(response.body);
      return jsonResponse.map((item)=>ItemModel.fromJson(item)).toList();
    }
    else{
      throw Exception("Fallo al cargar la lista de items");
    }
  }

}