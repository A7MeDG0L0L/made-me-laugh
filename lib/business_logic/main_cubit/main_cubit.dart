import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:made_me_laugh/business_logic/main_cubit/main_states.dart';
import 'package:made_me_laugh/data/nokta_model.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit():super(InitialMainState());
  static MainCubit get(context)=>BlocProvider.of(context);

  FirebaseFirestore fireStore = FirebaseFirestore.instance;


  // late Map<String,dynamic> nokaatData;
  //
  // Future<Map<String, dynamic>> getData()async{
  //   // CollectionReference nokaat =
  //   // FirebaseFirestore.instance.collection('nokaat');
  //   // nokaatData = snapshot.data!.data() as Map<String, dynamic>;
  //   // Future<QuerySnapshot> data=nokaat.get();
  //   // print(nokaatData);
  //   // emit(InitialGetDataSuccessState());
  //   // return data;
  //
  //   var collection = FirebaseFirestore.instance.collection('nokaat');
  //   var querySnapshot = await collection.get();
  //   print(querySnapshot.toString());
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //      nokaatData = queryDocumentSnapshot.data();
  //   }
  //   print(nokaatData);
  //   return nokaatData;
  //
  //
  // }

List<JokesModel> nokaat =[];
void getData(){
  emit(GetDataLoadingState());
  fireStore.collection('nokaat').get().then((value) {
    value.docs.forEach((element) {
      nokaat.add(JokesModel.fromJson(element.data()));
    //  print(element.data());
    });
    // print(nokaat.toString());
    // print(nokaat[2].joke);
    emit(GetDataSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(GetDataErrorState());
  });
}

  // final player = AudioCache(prefix: 'assets/audio/');
final player = AudioPlayer();
Future<void> playAudio(String fileName) async {
  var duration = await player.setAsset('assets/audio/$fileName');
  player.play();
}


}