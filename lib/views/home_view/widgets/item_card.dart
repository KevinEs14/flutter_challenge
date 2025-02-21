import 'package:flutter/material.dart';
import 'package:flutter_challenge/theme/colors.dart' as t;
import 'package:flutter_challenge/theme/text_theme.dart' as te;
class ItemCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ItemCard({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color cardColor = Theme.of(context).brightness == Brightness.dark
        ? t.Color.dgrey
        : t.Color.blue2;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        color: cardColor,
        margin: const EdgeInsets.symmetric(horizontal: t.Spacing.s12,vertical: t.Spacing.s4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(t.BorderRadius.r16)),
        child: Padding(
            padding: const EdgeInsets.all(t.Spacing.s12),
          child: Text(title,style: te.textTheme.titleLarge,),
        ),
      ),
    );
  }
}
