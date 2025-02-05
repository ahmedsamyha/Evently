import 'package:easy_localization/easy_localization.dart';
import 'package:evently/model/category_model.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/view/home/widgets/custom_category_item.dart';
import 'package:evently/view_model/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utility/helper/helper_funcation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<MyProvider>(context);
    final dark = HelperFunctions.isDarkMode(context);
    String lang = context.locale.languageCode == 'en' ? 'EN' : 'AR';
    IconData icon = dark ? Icons.wb_sunny : Icons.wb_sunny_outlined;
    List<CategoryModel> categoryList = [
      CategoryModel(
          categoryName: 'all',
          categoryTitle: "all".tr(),
          categoryIcon: Icons.done_all),
      CategoryModel(
          categoryName: 'sport',
          categoryTitle: "sport".tr(),
          categoryIcon: Icons.directions_bike_outlined),
      CategoryModel(
          categoryName: 'birthday',
          categoryTitle: "birthday".tr(),
          categoryIcon: Icons.cake_outlined),
      CategoryModel(
          categoryName: 'meeting',
          categoryTitle: "meeting".tr(),
          categoryIcon: Icons.business_rounded),
      CategoryModel(
          categoryName: 'gaming',
          categoryTitle: "gaming".tr(),
          categoryIcon: Icons.games_outlined),
      CategoryModel(
          categoryName: 'eating',
          categoryTitle: "eating".tr(),
          categoryIcon: Icons.fastfood_outlined),
      CategoryModel(
          categoryName: 'holiday',
          categoryTitle: "holiday".tr(),
          categoryIcon: Icons.holiday_village_outlined),
      CategoryModel(
          categoryName: 'exhibition',
          categoryTitle: "exhibition".tr(),
          categoryIcon: Icons.museum_outlined),
      CategoryModel(
          categoryName: 'workshop',
          categoryTitle: "work_shop".tr(),
          categoryIcon: Icons.work_outline),
      CategoryModel(
          categoryName: 'bookclub',
          categoryTitle: "book_club".tr(),
          categoryIcon: Icons.menu_book_outlined),
    ];
    return Column(
      children: [
        Container(
          height: height * .215,
          width: double.infinity,
          decoration: BoxDecoration(
              color: dark ? AppColors.darkBackground : AppColors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "welcome_back".tr(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'John Safwat',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color:
                                dark ? AppColors.textDarkWhite : Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Cairo , ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Egypt',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            provider.changeTheme();
                          });
                        },
                        icon: Icon(
                          icon,
                          color: dark ? AppColors.textDarkWhite : Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (context.locale.languageCode == 'en') {
                              context.setLocale(const Locale('ar'));
                            } else {
                              context.setLocale(const Locale('en'));
                            }
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                dark ? AppColors.textDarkWhite : Colors.white,
                          ),
                          child: Center(
                              child: Text(
                            lang,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: dark
                                          ? AppColors.darkBackground
                                          : AppColors.kPrimaryColor,
                                    ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomCategoryItem(
                            isSelected: categoryList[index] ==
                                categoryList[selectedIndex],
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            icon: categoryList[index].categoryIcon,
                            text: categoryList[index].categoryTitle,
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8,
                          ),
                      itemCount: categoryList.length)),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          height: height * .25,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/${dark ? 'dark' : 'light'}${selectedIndex>0?categoryList[selectedIndex].categoryName:'sport'}.png',
                ),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 56,
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: dark ? AppColors.darkBackground : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      ' 22\nNov',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: dark ? AppColors.darkBackground : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('This is a Birthday Party ',
                              style: Theme.of(context).textTheme.bodySmall),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: AppColors.kPrimaryColor,
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
