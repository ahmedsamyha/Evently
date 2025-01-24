import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/constants/images.dart';
import 'package:evently/view/on_boarding/start_view.dart';
import 'package:flutter/material.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),() {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StartView()));
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*.22,),
        Center(child: Image.asset(TAssets.verLogo)),
        SizedBox(height: height*.34,),
        Center(child: Image.asset(TAssets.route,color: AppColors.kPrimaryColor,)),


          ],
        ),
      ),
    );
  }
}
