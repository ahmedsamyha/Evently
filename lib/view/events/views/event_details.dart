import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/model/task_model.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/helper/helper_funcation.dart';
import 'package:evently/view/events/views/edit_event.dart';
import 'package:evently/view_model/create_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../model/category_model.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key, required this.model});
  TaskModel model;

  int selectedIndex = 0;

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);
    List<CategoryModel> categoryList = [
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
          categoryIcon: Icons.menu_book),
    ];
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "event_details".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.kPrimaryColor,
                  fontSize: 20),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.kPrimaryColor,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEventView(model: model)));
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 28,
                    color: AppColors.kPrimaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    FirebaseManager.deleteEvent(model.id);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/${dark ? 'dark' : 'light'}${model.image}.png',
                        width: double.infinity,
                        height: height * .25,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    model.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.kPrimaryColor),
                          child: Icon(
                            Iconsax.calendar_1_copy,
                            color:dark ?Colors.black:Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${formatMillisecondsToDate(model.date)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.kPrimaryColor),
                            ),
                            Text(
                              formatTimeTo12Hour(model.time),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: dark?AppColors.textDarkWhite:Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.kPrimaryColor),
                          child: Icon(
                            Icons.my_location_outlined,
                            color:dark?Colors.black: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cairo , ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.kPrimaryColor),
                              ),
                              Text(
                                'Egypt',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.kPrimaryColor),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: height * .45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage('assets/images/smallmap.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:dark?AppColors.textDarkWhite: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        model.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color:dark?AppColors.textDarkWhite: Colors.black),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  String formatMillisecondsToDate(int milliSecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecond);
    return DateFormat('d MMMM yyyy').format(date);
  }

  String formatTimeTo12Hour(String time) {
    List<String> parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    DateTime dateTime = DateTime(2024, 1, 1, hour, minute);
    return DateFormat('hh:mm a').format(dateTime);
  }
}

