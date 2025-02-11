import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/helper/helper_funcation.dart';
import 'package:evently/view/aouth/screens/login_view.dart';
import 'package:evently/view_model/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/user_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String dropdownLanguage = "english".tr();
  String dropdownTheme = "light".tr();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: height * .215,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64))),
          child: Row(
            children: [
              Align(
                  child: Image.asset(
                    'assets/images/route1.png',
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: 16),
              SizedBox(
                width: width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * .07),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        userProvider.userModel?.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color:
                          dark ? AppColors.textDarkWhite : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      userProvider.userModel?.email ?? '',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("language".tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: dark ? AppColors.textDarkWhite : Colors.black)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: Color(0xFF5669FF)),
          ),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(16),
            dropdownColor: dark?AppColors.darkBackground:AppColors.lightBackground,
            isExpanded: true,
            value: ["English", "Arabic"].contains(dropdownLanguage) ? dropdownLanguage : "English",
            underline: SizedBox(),
            items: [
              DropdownMenuItem(value: "English", child: Text('english'.tr())),
              DropdownMenuItem(value: "Arabic", child: Text('arabic'.tr())),
            ],
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  dropdownLanguage = value;
                  if (value == 'English') {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
                  }
                });
              }
            },
          ),
        ),

        SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("theme".tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: dark ? AppColors.textDarkWhite : Colors.black)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: Color(0xFF5669FF)),
          ),
          child: DropdownButton<String>(
            dropdownColor: dark?AppColors.darkBackground:AppColors.lightBackground,
            borderRadius: BorderRadius.circular(16),
            isExpanded: true,
            value: dropdownTheme,
            underline: SizedBox(),
            items: [
              DropdownMenuItem(value: "Light", child: Text('light'.tr())),
              DropdownMenuItem(value: "Dark", child: Text('dark'.tr())),
            ],
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  dropdownTheme = value;
                  var provider = Provider.of<MyProvider>(context, listen: false);

                  if (value == 'Light') {
                    provider.themeMode = ThemeMode.light;
                  } else {
                    provider.themeMode = ThemeMode.dark;
                  }

                  provider.notifyListeners();
                });
              }
            },
          ),
        ),

        SizedBox(height: 200),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: width,
            child: ElevatedButton(
                onPressed: () {
                  FirebaseManager.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                        (route) => false,
                  );
                },
                child: Text('Logout')),
          ),
        ),
      ],
    );
  }
}
