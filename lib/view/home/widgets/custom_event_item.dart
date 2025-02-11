import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/model/task_model.dart';
import 'package:evently/view/events/views/edit_event.dart';
import 'package:flutter/material.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/helper/helper_funcation.dart';

class CustomEventItem extends StatefulWidget {
  CustomEventItem({
    super.key,
    required this.selectedIndex,
    required this.model,
  });
  int selectedIndex;
  TaskModel model;

  @override
  State<CustomEventItem> createState() => _CustomEventItemState();
}

class _CustomEventItemState extends State<CustomEventItem> {
  void toggleFavorite() async {
    setState(() {
      widget.model.isFave = !widget.model.isFave;
    });

    await FirebaseFirestore.instance
        .collection('Tasks')
        .doc(widget.model.id)
        .update({'isFave': widget.model.isFave});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);
    var height = MediaQuery.of(context).size.height;
    IconData faveIcon =
        widget.model.isFave ? Icons.favorite : Icons.favorite_outline_outlined;
    return Container(
      width: double.infinity,
      height: height * .25,
      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/${dark ? 'dark' : 'light'}${widget.model.image}.png',
              // 'assets/images/${dark ? 'dark' : 'light'}${selectedIndex>0?provider.categoryList[selectedIndex].categoryName:model.image}.png',
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
                  ' ${DateTime.fromMillisecondsSinceEpoch(widget.model.date).toString().substring(8, 10)}\n${milliSecondsToMonth(widget.model.date)}',
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
                    children: [
                      SizedBox(
                        width: width * .4,
                        child: Text(widget.model.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            FirebaseManager.deleteEvent(widget.model.id);
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: AppColors.kPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditEventView(
                                          model: widget.model,
                                        )));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: AppColors.kPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            toggleFavorite();
                          },
                          icon: Icon(
                            faveIcon,
                            color: AppColors.kPrimaryColor,
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  String milliSecondsToMonth(int milliSecond) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(milliSecond); // Corrected
    return DateFormat('MMM').format(date);
  }
}
