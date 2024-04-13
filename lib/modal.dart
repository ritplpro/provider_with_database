
import 'database.dart';

class ProModal{
  int id;
  String title;
  String desc;

  ProModal({this.id=0,required this.title,required this.desc});

  factory ProModal.fromMap(Map<String,dynamic> map){
    return ProModal(id: map[ToProDatabase.Pro_Id],
        title:map[ToProDatabase.Pro_Title],
        desc: map[ToProDatabase.Pro_desc]);
  }

  Map<String,dynamic> toMap(){
    return{
      ToProDatabase.Pro_Title:title,
      ToProDatabase.Pro_desc:desc,
    };
  }



}