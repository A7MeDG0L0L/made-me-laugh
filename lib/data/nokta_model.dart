class JokesModel{
  String? joke;
  JokesModel(
  {required this.joke,}
      );
  JokesModel.fromJson(Map<String,dynamic>json){
    joke = json['nokta'];
  }
}
