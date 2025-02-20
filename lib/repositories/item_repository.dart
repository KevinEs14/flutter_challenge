
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_challenge/services/api_service.dart';

class ItemRepository{
  final ApiService _apiService;

  ///Function for the list of items
  ItemRepository(this._apiService);
  Future<List<ItemModel>> getItemsList(int page){
    return _apiService.obtainItems(page);
  }

  ///Function for specific details of an Item
  Future<ItemModel> getItemDetails(int id){
    return _apiService.itemDetails(id);
  }
}