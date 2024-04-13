

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_database/provider_modal.dart';
import 'add_update.dart';
import 'database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ToProDatabase? proDatabase;



  @override
  void initState() {
    super.initState();
    context.read<TodoProvider>().getinitialser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page '),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Consumer<TodoProvider>(
          builder:(context,value,_){
            var fData= value.fetchallDta();
            return fData.isEmpty ? Center(child: Text('No Notes avlaible..')):ListView.builder(
                itemCount: fData.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.only(topRight: Radius.circular
                            (3),bottomLeft: Radius.circular(23)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                spreadRadius: 1
                            )
                          ]
                      ),
                      child: ListTile(
                        leading:Text("${index+1}") ,
                        title:Text(fData[index].title) ,
                        subtitle:Text(fData[index].desc) ,
                        trailing: SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)
                                        =>AddUpdatePage(isUpdated: true,
                                          proModal: fData[index],)));

                                    },icon:  Icon(Icons.edit_note)),
                                  IconButton(onPressed: (){
                                    context.read<TodoProvider>().deleteDa(fData[index].id);
                                  },icon:  Icon(Icons.delete_outlined))
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  );

                });

          } ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          =>AddUpdatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


