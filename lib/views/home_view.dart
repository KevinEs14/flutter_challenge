import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_challenge/viewModels/item_provider.dart';
import 'package:flutter_challenge/viewModels/theme_provider.dart';
import 'package:flutter_challenge/views/specific_item_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challenge/theme/colors.dart' as t;
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage=1;
  final TextEditingController _searchController=TextEditingController();
  List<ItemModel> _itemList=[];
  List<ItemModel> _filteredList=[];
  
  @override
  void initState(){
    super.initState();
    _getItemsList();
  }
  
  void _getItemsList(){
    Provider.of<ItemProvider>(context, listen: false).getItemsList(currentPage).then((_) {
      setState(() {
        _itemList = Provider.of<ItemProvider>(context, listen: false).itemsList;
        _filteredList = _itemList;
      });
    }).catchError((error) {
      print('Error al obtener la lista: $error');//manejar mejor esto
    });
  }
  
  void _searchItem(String titleSearched){
    if(titleSearched.isNotEmpty){
      setState(() {
        _filteredList=_itemList.where((item)=>item.title.toLowerCase().contains(titleSearched.toLowerCase())).toList();
      });
    }else{
      setState(() {
        _filteredList=_itemList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider=Provider.of<ItemProvider>(context);
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(t.Spacing.s40),
            child: Padding(
                padding: EdgeInsets.all(t.Spacing.s12),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value){
                    _searchItem(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Busca el nombre de un item',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(t.BorderRadius.r30)),
                  ),
                ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            themeProvider.changeTheme();
          },
        child: Icon(Icons.sunny),
      ),
      body: itemProvider.isLoading?Center(child: CircularProgressIndicator(),):
            itemProvider.errorMessage!=null? Center(child: Text(itemProvider.errorMessage!))
      : ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (context, index){
                final item=_filteredList[index];
                return ListTile(
                  title: Text(item.title),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificItemView(itemId: item.id)));
                  },
                );
              }
            ),
    );
  }
}
