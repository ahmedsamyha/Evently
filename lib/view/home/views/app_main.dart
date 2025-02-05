import 'package:evently/view/events/views/create_event.dart';
import 'package:evently/view/home/views/love_view.dart';
import 'package:evently/view/home/views/map_view.dart';
import 'package:evently/view/home/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/helper/helper_funcation.dart';
import 'home_view.dart';


class AppMainView extends StatefulWidget {
  const AppMainView({super.key});

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  int currentIndex = 0;
 /* Widget _getNavItem(String imageNAme, int index) {
    return currentIndex == index
        ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.kBlackColor.withOpacity(.6),
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(AssetImage('assets/images/home/$imageNAme')))
        : ImageIcon(AssetImage('assets/images/home/$imageNAme'));
  }*/

  List<Widget> screens = [
    const HomeView(),
    const MapView(),
    const LoveView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: dark? PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:currentIndex ==3?AppColors.kPrimaryColor:AppColors.darkBackground
          ),
        ),
      ):PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:currentIndex ==0||currentIndex==3?AppColors.kPrimaryColor:AppColors.lightBackground
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 100),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateEvent()));
        },
        backgroundColor: dark?AppColors.darkBackground:AppColors.kPrimaryColor,
          shape: CircleBorder(side: BorderSide(color: dark?AppColors.textDarkWhite:AppColors.textWhite,width: 5)),
          child: Icon(Icons.add,color: AppColors.textWhite,size: 32,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: dark?AppColors.darkBackground:AppColors.kPrimaryColor,
        selectedItemColor:dark?AppColors.darkIcon:AppColors.textWhite,
        unselectedItemColor: dark?AppColors.darkIcon:AppColors.textWhite,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon:currentIndex==0?Icon(Iconsax.home):Icon(Iconsax.home_1_copy), label: 'Home'),
          BottomNavigationBarItem(
              icon: currentIndex==1?Icon(Icons.location_on):Icon(Icons.location_on_outlined), label: 'Map'),
          BottomNavigationBarItem(icon: currentIndex==2?Icon(Iconsax.heart):Icon(Iconsax.heart_copy), label: 'Love'),
          BottomNavigationBarItem(
              icon: currentIndex==3?Icon(Iconsax.profile_2user):Icon(Iconsax.profile_2user_copy), label: 'Profile'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

