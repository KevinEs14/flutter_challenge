import 'package:flutter/material.dart';
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
  final ScrollController _listController=ScrollController();
  
  @override
  void initState(){
    super.initState();
    Future.microtask((){_getItemsList();});
  }
  
  void _getItemsList({String? searchItem, bool init=false}){
    Provider.of<ItemProvider>(context, listen: false).getItemsList(currentPage, searchItem: searchItem,init: init);
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
                    if(value.isNotEmpty) {
                      _getItemsList(searchItem: value, init: true);
                    }else{
                      _getItemsList(init: true);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search the complete name of an item',
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
            itemProvider.errorListMessage!=null? Center(child: Text(itemProvider.errorListMessage!))
      : ListView.builder(
              itemCount: itemProvider.itemsList.length+1,
              controller: _listController..addListener(
                () {
                if (_listController.offset ==
                _listController.position.maxScrollExtent &&
                !itemProvider.isLoadingItems ) {
                  currentPage++;
                  _getItemsList();
                }
                }
              ),
              itemBuilder: (context, index){
                if(index==itemProvider.itemsList.length){
                  if(itemProvider.isLoadingItems){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(t.Spacing.s12),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    );
                  }else{
                    return SizedBox.shrink();
                  }
                }
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
