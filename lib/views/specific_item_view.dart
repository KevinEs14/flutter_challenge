import 'package:flutter/material.dart';
import 'package:flutter_challenge/viewModels/item_provider.dart';
import 'package:provider/provider.dart';

class SpecificItemView extends StatelessWidget {
  final int itemId;

  const SpecificItemView({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final itemProvider=Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
      ),
      body: FutureBuilder(
          future: itemProvider.getItemDetails(itemId), // ver si hay mejor forma de tomar el error o el loading con respecto al provider
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }
            final item=snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(16),//usar documento global
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item!.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text(item.body)
                ],
              ),
            );
          }
      ),
    );
  }
}
