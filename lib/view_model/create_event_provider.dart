import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier{
  var selectedDate = DateTime.now();
  String selectedTime= '12:00 AM';
  changeSelectedDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

  changeSelectedTime(TimeOfDay time){
    String formattedTime = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2,'0')}';
    selectedTime = formattedTime;
    notifyListeners();
  }
}