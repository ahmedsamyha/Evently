import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/constants/images.dart';
import 'package:evently/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../view_model/my_provider.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  bool firstSwitchValue=false;
  bool secondSwitchValue=false;

  bool firstSwitchTheme=false;
  bool secondSwitchTheme=false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:24,
              ),
              Center(child: Image.asset(TAssets.horLogo,color: AppColors.kPrimaryColor,)),
              SizedBox(
                height:32,
              ),
              SvgPicture.asset(TAssets.start),
              SizedBox(
                height:16,
              ),
              Text("start_title".tr(),style: Theme.of(context).textTheme.titleMedium!),
              SizedBox(height: 16,),
              Text("start_body".tr(),style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("language".tr(),style: Theme.of(context).textTheme.headlineMedium!),
                  AnimatedToggleSwitch.dual(
                    current: secondSwitchValue,
                    first: false,
                    second: true,
                    spacing: 10,
                    style: ToggleStyle(
                      borderColor: AppColors.kPrimaryColor,
                      backgroundColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                        indicatorColor: AppColors.kPrimaryColor,
                    ),
                    borderWidth: 3,
                    height: 50,
                   onChanged: (value){
                      setState(() {
                        secondSwitchValue = value;
                        if(value == true ){
                          context.setLocale(Locale('en'));
                          print(context.locale.toString());
                        }else{
                          context.setLocale(Locale('ar'));
                          print(context.locale.toString());
                        }
                      });
                   },
                   // onChanged:(value) => setState(() => secondSwitchValue = value),
                    iconBuilder: (value)=>value?SvgPicture.asset('assets/images/lr.svg',height: 40,width: 40,):SvgPicture.asset('assets/images/eg.svg',height:40,width: 40,),
                    textBuilder: (value)=>value?SvgPicture.asset('assets/images/eg.svg',height: 40,width: 40,):SvgPicture.asset('assets/images/lr.svg',height: 40,width: 40) ,
                    textMargin: EdgeInsets.zero,

                  )

                ],
              ),
              SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("theme".tr(),style: Theme.of(context).textTheme.headlineMedium!),
                  AnimatedToggleSwitch.dual(
                    current: secondSwitchTheme,
                    first: false,
                    second: true,
                    spacing: 10,
                    style: ToggleStyle(
                      borderColor: AppColors.kPrimaryColor,
                      backgroundColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                        indicatorColor: AppColors.kPrimaryColor,
                    ),
                    borderWidth: 3,
                    height: 50,
                    onChanged:(value){
                      setState(() {
                        secondSwitchTheme = value;
                        provider.changeTheme();
                      });
                    },
                    iconBuilder: (value)=>value?Icon(Iconsax.moon , size: 30):Icon(Icons.sunny , size: 30,),
                    textBuilder: (value)=>value?Icon(Icons.sunny , size: 30,):Icon(Iconsax.moon , size: 30,) ,
                    textMargin: EdgeInsets.zero,
                  ),
                ],
              ),
              SizedBox(height:24),
              SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>OnBoardingView()));
              }, child: Text("lets_start".tr()),))
            ],
          ),
        ),
      ),
    );
  }
}
