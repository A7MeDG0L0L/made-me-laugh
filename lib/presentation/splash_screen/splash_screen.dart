import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:made_me_laugh/business_logic/main_cubit/main_cubit.dart';
import 'package:made_me_laugh/business_logic/main_cubit/main_states.dart';
import 'package:made_me_laugh/presentation/main_screen/main_screen.dart';
import 'package:made_me_laugh/shared/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
          (context) => const Directionality(textDirection: TextDirection.rtl,child: MainScreen())), (route) => false);
    });
    //TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [orangeColors, orangeLightColors],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
            ),
            child: Column(
              children: [
                Center(child: Image.asset("assets/images/splash.png")),
                const SizedBox(height: 40,),
                const Text(' ضحكني شكراً',style: TextStyle(color: Colors
                    .white,fontSize: 22,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        );
      },
    );
  }
}
