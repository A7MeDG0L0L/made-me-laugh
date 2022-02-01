import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:made_me_laugh/business_logic/main_cubit/main_cubit.dart';
import 'package:made_me_laugh/business_logic/main_cubit/main_states.dart';
import 'package:made_me_laugh/data/nokta_model.dart';
import 'package:made_me_laugh/shared/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // AudioPlayer audioPlayer = AudioPlayer();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // CollectionReference nokaat =
    //     FirebaseFirestore.instance.collection('nokaat');

  //  AsyncSnapshot<DocumentSnapshot>? snapshot;

    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state) {},
      builder:
        (context, state) {
          // final player = AudioCache(prefix: 'assets/audio/');

          late  List<JokesModel> nokaat = MainCubit.get(context).nokaat;
    String? random=nokaat[Random().nextInt
      (nokaat.length)].joke;
      return Scaffold(
        appBar: AppBar(
          title: const Text('ضحكني شكراً'),
          actions: [
            TextButton.icon(onPressed: (){
              Share.share(random!);
            }, icon: const Icon(Icons.share,
              color: Colors.black,),
                label:
            const Text('شاركها',style: TextStyle(color: Colors.black),))
          ],
          toolbarHeight: 80,centerTitle: true,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),

        ),
          ),
        ),
        body: random!.isNotEmpty ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: orangeColors,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${random}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 30,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          MainCubit.get(context).playAudio('haha.mp3');
                          // player.play('haha.mp3');
                        },
                        child: const Text('إضحك')),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                        onPressed: () {
                          MainCubit.get(context).playAudio('another_one.mp3');
                          // if(player.duckAudio) {
                          //   player.play('another_one.mp3');
                          // }
                          setState(() {
                            Future.delayed(const Duration(seconds: 3));

                              random=nokaat[Random().nextInt
                              (nokaat.length)].joke;
                            print(random);
                          });
                        },
                        child: Text('كمان واحده')),
                  ],
                ),
              ),
            ],
          ),
        ) : Center(child: const CircularProgressIndicator()),
        // body: FutureBuilder(
        //   future: nokaat.doc(Random().nextInt(6).toString()).get(),
        //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text("Something went wrong");
        //     }
        //     if (snapshot.hasData && !snapshot.data!.exists) {
        //       return Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //
        //           children: [
        //             Lottie.asset('assets/loading/not_found.json',width: 200),
        //             SizedBox(height: 30,),
        //             Text("Document does not exist"),
        //             SizedBox(height: 30,),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   if(player.respectSilence)
        //                     player.play('another_one.mp3');
        //
        //                   setState(() {
        //                     Future.delayed(Duration(seconds: 3));
        //
        //                     final   random=nokaat.doc(Random().nextInt(6)
        //                         .toString());
        //                     print(random);
        //                   });
        //                 },
        //                 child: Text('كمان واحده')),
        //           ],
        //         ),
        //       );
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       Map<String, dynamic> data =
        //       snapshot.data!.data() as Map<String, dynamic>;
        //       return Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Container(
        //                   decoration: BoxDecoration(
        //                       color: orangeColors,
        //                       borderRadius: BorderRadius.circular(25)),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Text(
        //                       "${data['nokta']}",
        //                       style: const TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 22,
        //                       ),
        //                     ),
        //                   )),
        //             ),
        //             SizedBox(height: 30,),
        //             Center(
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   ElevatedButton(
        //                       onPressed: () {
        //                         player.play('haha.mp3');
        //                       },
        //                       child: Text('إضحك')),
        //                   SizedBox(width: 20,),
        //                   ElevatedButton(
        //                       onPressed: () {
        //                         if(player.respectSilence)
        //                           player.play('another_one.mp3');
        //
        //                         setState(() {
        //                           Future.delayed(Duration(seconds: 3));
        //
        //                           final   random=nokaat.doc(Random().nextInt(6)
        //                               .toString());
        //                           print(random);
        //                         });
        //                       },
        //                       child: Text('كمان واحده')),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        //
        //     return  Center(child: Lottie.asset('assets/loading/loading.json'));
        //   },
        // ),
      );
    },);
  }
}
