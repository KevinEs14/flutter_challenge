import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_challenge/repositories/item_repository.dart';

class ItemProvider with ChangeNotifier{
  final ItemRepository itemRepository;
  List<ItemModel> _itemList=[];
  ItemModel? _itemDetail;
  ItemModel? _searchedItem;
  bool _isLoadingItems=false;
  bool _listEnd=false;
  bool _isLoading=false;
  String? _errorListMessage;
  String? _errorDetailMessage;

  ItemProvider(this.itemRepository);

  List<ItemModel> get itemsList=>_itemList;
  ItemModel? get itemDetail=>_itemDetail;
  bool get isLoadingItems=>_isLoadingItems;
  bool get isLoading=>_isLoading;

  String? get errorListMessage=>_errorListMessage;
  String? get errorDetailMessage=>_errorDetailMessage;
  ItemModel? get searchedItem=>_searchedItem;

  //Function for list of items with managing of error message
  Future<void> getItemsList(int page, {String? searchItem, bool init=false})async {
    _errorListMessage=null;
    if(init){
      page=0;
      _itemList=[];
      _listEnd=false;
    }
    if(_listEnd){return;}
    if(page==0){
      _isLoading=true;
    }else{
      _isLoadingItems=true;
    }
    notifyListeners();
    try{
      final partialList=await itemRepository.getItemsList(page, searchItem: searchItem);
      _itemList.addAll(partialList);
      if(partialList.isEmpty){
        _listEnd=true;
      }
      _errorListMessage=null;
    }catch (e){
      _errorListMessage=e.toString();
      notifyListeners();
    }finally{
      _isLoadingItems=false;
      _isLoading=false;
      notifyListeners();
    }
  }

  //Function for item details with managing of error message
  Future<void> getItemDetails(int id)async{
    try{
      _itemDetail=null;
      _errorDetailMessage=null;
      notifyListeners();
      _itemDetail= await itemRepository.getItemDetails(id);
      notifyListeners();
    }catch (e){
      _errorDetailMessage=e.toString();
      notifyListeners();
    }
  }

}