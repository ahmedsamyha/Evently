import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/model/task_model.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/helper/helper_funcation.dart';
import 'package:evently/view/aouth/widgets/custom_text_form_field.dart';
import 'package:evently/view_model/create_event_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../model/category_model.dart';
import '../widgets/create_category_list_item.dart';

class EditEventView extends StatefulWidget {
  EditEventView({super.key, required this.model});
  TaskModel model;
  @override
  State<EditEventView> createState() => _EditEventViewState();
}

class _EditEventViewState extends State<EditEventView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.model.title);
    descriptionController =
        TextEditingController(text: widget.model.description);
    selectedIndex = widget.model.num;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
              "edit_event".tr(),
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
                        selectedIndex == widget.model.num
                            ? 'assets/images/${dark ? 'dark' : 'light'}${widget.model.image}.png'
                            : 'assets/images/${dark ? 'dark' : 'light'}${categoryList[selectedIndex].categoryName}.png',
                        width: double.infinity,
                        height: height * .25,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: CreateCategoryListItem(
                              icon: categoryList[index].categoryIcon,
                              text: categoryList[index].categoryTitle,
                              isSelected: index == selectedIndex,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 8,
                            ),
                        itemCount: categoryList.length),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "title".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      prefixIcon: Iconsax.edit_copy,
                      controller: titleController,
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "description".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      obscureText: false),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(Iconsax.calendar_1_copy),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "event_date".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          var chosenDate = await showDatePicker(
                              context: context,
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)));
                          if (chosenDate != null) {
                            provider.changeSelectedDate(chosenDate);
                          }
                        },
                        child: Text(
                          provider.selectedDate.toString().substring(0, 10),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Iconsax.clock_copy),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "event_time".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? chosenTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (chosenTime != null) {
                            provider.changeSelectedTime(chosenTime);
                          }
                        },
                        child: Text(
                          provider.selectedTime,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "location".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Container(
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
                            child: Icon(Icons.my_location_outlined),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "choose_event_location".tr(),
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            TaskModel updatedTask = TaskModel(
                              uID: FirebaseAuth.instance.currentUser!.uid,
                              id: widget.model.id,
                              title: titleController.text,
                              description: descriptionController.text,
                              image: categoryList[selectedIndex].categoryName,
                              date:
                                  provider.selectedDate.millisecondsSinceEpoch,
                              time: provider.selectedTime,
                              num: selectedIndex,
                            );
                            FirebaseManager.updateEvent(updatedTask)
                                .then((_) => Navigator.pop(context));
                          },
                          child: Text("edit_event".tr()))),
                  SizedBox(
                    height: 16,
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
    return DateFormat('dd-MM-yyyy').format(date);
  }

  String formatTimeTo12Hour(String time) {
    List<String> parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    DateTime dateTime = DateTime(2024, 1, 1, hour, minute);
    return DateFormat('hh:mm a').format(dateTime);
  }
}
