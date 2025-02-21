
import 'package:flutter_challenge/models/item_model.dart';

abstract class ItemRepository{

  ///Function for the list of items
  Future<List<ItemModel>> getItemsList(int page, {int limit=20,String? searchItem});

  ///Function for specific details of an Item
  Future<ItemModel> getItemDetails(int id);
}