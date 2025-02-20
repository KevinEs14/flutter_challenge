import 'package:flutter/material.dart';
import 'package:flutter_challenge/viewModels/item_provider.dart';
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
  
  @override
  void initState(){
    super.initState();
    _getItemsList();
  }
  
  void _getItemsList(){
    Provider.of<ItemProvider>(context, listen: false).getItemsList(currentPage);
  }
  
  void _searchItem(){}//logica para buscador

  @override
  Widget build(BuildContext context) {
    final itemProvider=Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Challenge"),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(t.Spacing.s40), //usar del documento uno de los spacings
            child: Padding(
                padding: EdgeInsets.all(t.Spacing.s12),//Usar del documento
                child: TextField(
                  controller: _searchController,
                  onChanged: (value)=>_searchController,
                  decoration: InputDecoration(
                    hintText: 'Busca el nombre de un item',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(t.BorderRadius.r30)),
                  ),
                ),
            )
        ),
      ),
      body: itemProvider.isLoading?Center(child: CircularProgressIndicator(),):
            itemProvider.errorMessage!=null? Center(child: Text(itemProvider.errorMessage!))
      : ListView.builder(
              itemCount: itemProvider.itemsList.length,
              itemBuilder: (context, index){
                final item=itemProvider.itemsList[index];
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
