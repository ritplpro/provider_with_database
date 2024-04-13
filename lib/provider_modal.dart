import 'package:flutter/material.dart';
import 'database.dart';
import 'modal.dart';

class TodoProvider extends ChangeNotifier{
  ToProDatabase proToBase;

  TodoProvider({required this.proToBase});

  List<ProModal> _proData=[];

//add data
  Future<void> addNote(ProModal addModal) async {
    proToBase.addData(addModal);
    _proData=await proToBase.fetchData();

    notifyListeners();
  }
// fetch Data
  List<ProModal> fetchallDta()  {
    return _proData;
  }
  // for updated
  void updateData(ProModal updatedn) async {
    proToBase.updateData(updatedn);
    _proData=await proToBase.fetchData();

    notifyListeners();
  }

//deleteted for

  void deleteDa(int id ) async {
    proToBase.deleteData(id);
    _proData=await proToBase.fetchData();

    notifyListeners();
  }

//getinital

  Future<void> getinitialser() async {
    _proData=  await proToBase.fetchData();

    notifyListeners();
  }


}