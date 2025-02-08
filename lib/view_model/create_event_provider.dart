import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier{
  var selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  changeSelectedDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

  changeSelectedTime(TimeOfDay time){
    selectedTime = time;
    notifyListeners();
  }
}