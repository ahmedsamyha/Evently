import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/view/events/views/event_details.dart';
import 'package:evently/view/home/widgets/custom_category_item.dart';
import 'package:evently/view/home/widgets/custom_event_item.dart';
import 'package:evently/view_model/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/task_model.dart';
import '../../../utility/helper/helper_funcation.dart';
import '../../../view_model/user_provider.dart';

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
    var userProvider = Provider.of<UserProvider>(context);

    final dark = HelperFunctions.isDarkMode(context);
    String lang = context.locale.languageCode == 'en' ? 'EN' : 'AR';
    IconData icon = dark ? Icons.wb_sunny : Icons.wb_sunny_outlined;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * .215,
            width: double.infinity,
            decoration: BoxDecoration(
                color:
                    dark ? AppColors.darkBackground : AppColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "welcome_back".tr(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: width*.6,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            userProvider.userModel?.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: dark
                                      ? AppColors.textDarkWhite
                                      : Colors.white,
                                ),
                          ),
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
                              '${"cairo".tr()} , ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "egypt".tr(),
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
                            color:
                                dark ? AppColors.textDarkWhite : Colors.white,
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
                                setState(() {
                                  context.setLocale(const Locale('ar'));
                                });
                              } else {
                                setState(() {
                                  context.setLocale(const Locale('en'));
                                });
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                              isSelected: provider.categoryList[index] ==
                                  provider.categoryList[selectedIndex],
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              icon: provider.categoryList[index].categoryIcon,
                              text: provider.categoryList[index].categoryTitle
                                  .tr(),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 8,
                            ),
                        itemCount: provider.categoryList.length)),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getEvents(selectedIndex),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong!"));
              }

              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.data!.docs.isEmpty) {
                return Padding(
                  padding:  EdgeInsets.only(top:height*.2 ),
                  child: Image.asset('assets/images/hom0.png',
                      height: 150, width: 150),
                );
              }

              return Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var eventModel = snapshot.data!.docs[index].data();

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EventDetails(model: eventModel),
                          ),
                        );
                      },
                      child: CustomEventItem(
                        model: eventModel,
                        selectedIndex: selectedIndex,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
