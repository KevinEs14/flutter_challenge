import 'package:flutter/material.dart';
import 'package:flutter_challenge/viewModels/item_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challenge/theme/colors.dart' as t;
import 'package:flutter_challenge/theme/text_theme.dart' as te;

class SpecificItemView extends StatefulWidget {
  final int itemId;

  const SpecificItemView({super.key, required this.itemId});

  @override
  State<SpecificItemView> createState() => _SpecificItemViewState();
}

class _SpecificItemViewState extends State<SpecificItemView> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){_getItemDetail();});
  }

  void _getItemDetail(){
      Provider.of<ItemProvider>(context,listen:false).getItemDetails(widget.itemId);
  }


  @override
  Widget build(BuildContext context) {
    final itemProvider=Provider.of<ItemProvider>(context);
    Color containerColor = Theme.of(context).brightness == Brightness.dark
        ? t.Color.dgrey
        : t.Color.coffee;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
      ),
      body: itemProvider.errorDetailMessage!=null? Center(child: Text(itemProvider.errorDetailMessage!))
      :itemProvider.itemDetail==null?Center(child: CircularProgressIndicator(),)
      :Padding(
          padding: const EdgeInsets.all(t.Spacing.s12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(t.BorderRadius.r16),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(t.Spacing.s12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemProvider.itemDetail!.title,style: te.textTheme.displayMedium),
                    SizedBox(height: t.Spacing.s12),
                    Text(itemProvider.itemDetail!.body,style: te.textTheme.bodyLarge)
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
