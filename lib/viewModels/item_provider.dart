import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_challenge/repositories/item_repository.dart';

class ItemProvider with ChangeNotifier{
  final ItemRepository itemRepository;
  List<ItemModel> _itemList=[];
  bool _isLoading=false;
  String? _errorMessage; //tal vez aca puedo darle directo null

  ItemProvider(this.itemRepository);

  List<ItemModel> get itemsList=>_itemList;
  bool get isLoading=>_isLoading;
  String? get errorMessage=>_errorMessage;

  //Function for list of items with managing of error message
  Future<void> getItemsList(int page)async {
    _isLoading=true;
    notifyListeners();
    try{
      _itemList=await itemRepository.getItemsList(page);
      _errorMessage=null;
    }catch (e){
      _errorMessage=e.toString();
      notifyListeners();
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }

  //Function for item details with managing of error message
  Future<ItemModel?> getItemDetails(int id)async{//Revisar el uso de tipo null y el notifyListeners en el error.
    try{
      return await itemRepository.getItemDetails(id);
    }catch (e){
      _errorMessage=e.toString();
      notifyListeners();
      return null;
    }
  }
}