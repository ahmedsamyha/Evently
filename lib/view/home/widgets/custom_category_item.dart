import 'package:evently/utility/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utility/helper/helper_funcation.dart';

class CustomCategoryItem extends StatelessWidget {
   CustomCategoryItem({
    super.key,required this.onTap,required this.icon, required this.text,required this.isSelected
  });
final void Function()? onTap;
final IconData? icon;
final String text;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration:dark? BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(color: dark?AppColors.kPrimaryColor: Colors.white),
        ):BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(color: dark?AppColors.kPrimaryColor: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            dark ?Icon(icon,color:isSelected?Colors.white: AppColors.textDarkWhite):Icon(icon,color:isSelected?AppColors.kPrimaryColor: Colors.white),


            SizedBox(width: 8,),
            Text(text,style:isSelected?Theme.of(context).textTheme.bodyMedium!.copyWith(color:dark?AppColors.textDarkWhite: AppColors.kPrimaryColor):Theme.of(context).textTheme.bodyMedium!.copyWith(color:dark?AppColors.textDarkWhite: Colors.white),),
          ],
        ),
      ),
    );
  }
}