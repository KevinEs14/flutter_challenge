import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {

  final String baseUrl = dotenv.env['API_URL'] ?? '';

  //ver cambiar un try catch en lugar de if
  Future<List<ItemModel>> obtainItems(int page, {int limit=10}) async {
    final response=await http.get(Uri.parse('$baseUrl?_page=$page&_limit=$limit'));
    if(response.statusCode==200){
      List jsonResponse=json.decode(response.body);
      return jsonResponse.map((item)=>ItemModel.fromJson(item)).toList();
    }
    else{
      throw Exception("Fallo al cargar la lista de items");
    }
  }

  Future<ItemModel> itemDetails(int id)async {
    final response=await http.get(Uri.parse('$baseUrl/$id'));
    if(response.statusCode==200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Fallo al cargar los datos del item");
    }
  }
}