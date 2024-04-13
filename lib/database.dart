import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'modal.dart';


class ToProDatabase{


  ToProDatabase._();

  static final ToProDatabase proToBase=ToProDatabase._();



  static const String Pro_TName="notePro";
  static const String Pro_Id="note_id";
  static const String Pro_Title="note_title";
  static const String Pro_desc="note_desc";





  Database? myData;

  createDatafile() async {
    if(myData != null){
      return myData;
    }else{
      var myData= await createBase();
      return await myData;
    }
  }

  createBase() async {
    var makefile= await getApplicationDocumentsDirectory();
    var actualpath=join(makefile.path,"todopro.db");
    return await openDatabase(actualpath,version: 1,onCreate: (proToBase,version){
      proToBase.execute("create table  $Pro_TName ( $Pro_Id integer primary "
          "key autoincrement,$Pro_Title text,$Pro_desc text)");

    });
  }

  //insert(addData)


  addData(ProModal toinsert) async {
    var write=await createDatafile();
    return write.insert(Pro_TName,toinsert.toMap());
  }

  //fetch

  fetchData() async {
    var alldata=await createDatafile();
    var tooist=await alldata.query(Pro_TName);
    List<ProModal> fData=[];

    for(Map<String,dynamic> eachMap in tooist ){
      var dataf=ProModal.fromMap(eachMap);

      fData.add(dataf);
    }
    return fData;
  }

  //update

  updateData(ProModal updatenote) async {
    var aldta=await createDatafile();
    aldta.update(Pro_TName,updatenote.toMap(),
        where:"$Pro_Id=${updatenote.id}");

  }

  //delete

  deleteData(int id) async {
    var remove=await createDatafile();
    remove.delete(Pro_TName,where:"$Pro_Id = ?",whereArgs:["$id"]);

  }


}


