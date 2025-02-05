import 'package:evently/utility/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utility/helper/helper_funcation.dart';

class CreateCategoryListItem extends StatelessWidget {
   CreateCategoryListItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
  });
  final IconData? icon;
  final String text;
   bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: AppColors.kPrimaryColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color:isSelected?Colors.white: AppColors.kPrimaryColor),
          SizedBox(
            width: 8,
          ),
          Text(text,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isSelected
                      ? AppColors.textWhite
                      : AppColors.kPrimaryColor)),
        ],
      ),
    );
  }
}
