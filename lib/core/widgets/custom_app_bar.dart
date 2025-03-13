import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CutomAppBar extends StatelessWidget 
//implements PreferredSizeWidget
 {
  const CutomAppBar({
    super.key, this.title,
  });
final String? title;
  @override
 // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
     leading: Center(
       child: SvgPicture.asset('assets/images/back_arrow.svg')),
     centerTitle: true,
     title: Text(title ?? '',
     textAlign: TextAlign.center,
     style: Styles.textstyle25,),
            );
  }
}