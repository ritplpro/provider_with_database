


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_database/provider_modal.dart';
import 'modal.dart';
import 'provider_modal.dart';

class AddUpdatePage extends StatelessWidget {


  bool isUpdated;
  ProModal? proModal;
  AddUpdatePage({this.isUpdated = false,this.proModal});

  var  titleController=TextEditingController();
  var  descController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(proModal!=null){
      titleController.text=proModal!.title;
      descController.text=proModal!.desc;
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Text(isUpdated ? "Update Note" : "Add Note"),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  )
              ),

            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Add Description"),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller:descController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  )
              ),

            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){

                  if(isUpdated != true) {
                    context.read<TodoProvider>().addNote(ProModal(
                        title: titleController.text.toString(),
                        desc: descController.text.toString()));

                    Navigator.pop(context);
                  }else{
                    context.read<TodoProvider>().updateData(ProModal(
                        title:titleController.text,
                        id: proModal!.id,
                        desc: descController.text));

                    Navigator.pop(context);

                  }




                }, child: Text(isUpdated ? "Update Note" : "Add Note")),
                ElevatedButton(onPressed: (){

                  Navigator.pop(context);

                }, child: Text("Cancel")),
              ],
            )

          ],
        ),
      ) ,
    );
  }
}
