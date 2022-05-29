import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_todo/widgets/button_widget.dart';

import '../widgets/task_widget.dart';

class AllTasks
 extends StatelessWidget {
  const AllTasks
  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData =[
      "Work smart",
      "Not hard.."
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xff2e3253).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
    ); 
     final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon( 
        Icons.delete,
        color: Colors.white,
        ),
        alignment: Alignment.centerRight,
    ); 
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                Get.back(); 
              },
              child: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 227, 244, 228),),
            ) ,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage(
                  "assets/header1.jpg"
                )
              )
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20 ),
            child: Row(
              children: [
                const Icon(Icons.home, color: Color.fromARGB(255, 69, 115, 244),),
                const SizedBox(width: 10,),
                Container(
                  child: const Icon(Icons.add, color: Colors.white, size: 20,),
                  width: 25,
                    height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: const Color.fromARGB(255, 14, 50, 147)
                    
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.calendar_view_day_sharp, color: Color.fromARGB(255, 69, 115, 244),),
                const SizedBox(width: 10,),
                const Text("7", style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 69, 115, 244)),)
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index){
              return Dismissible(
                background: leftEditIcon,
                secondaryBackground: rightDeleteIcon,
                onDismissed: (DismissDirection direction){
                  print("after dismiss");
                },
                confirmDismiss: (DismissDirection direction)async{
                  if(direction==DismissDirection.startToEnd){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      context: context, 
                    builder: (_){
                      return Container(
                       height: 550,
                       decoration:  BoxDecoration(
                         color:const Color(0xff2e3253).withOpacity(0.4),
                         borderRadius: const BorderRadius.only(
                           topRight: Radius.circular(20),
                           topLeft: Radius.circular(20)
                         )
                       ),
                        //child: const Padding(
                          //padding: co nst EdgeInsets.only(left: 20, right: 20),)
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              ButtonWidget(backgroundcolor: Color.fromARGB(255, 6, 6, 114), text:"View", textColor: Colors.white),
                              SizedBox(height: 20,),
                              ButtonWidget(backgroundcolor: Color.fromARGB(255, 6, 6, 114 ), text:"Edit", textColor: Colors.white),
                            ],
                            
                          ),
                        ),
                      );
                    });
                    return false;
                  }else{

                    return Future.delayed(const Duration(seconds: 1),()=>direction==DismissDirection.endToStart);
                  }
                  }, 
                key: ObjectKey(index),
                child: Container( 
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TaskWidget(
                    text: myData[index],
                    color: Colors.blueGrey,
                  ),
                ),
              );
            }),
          )
        ]),
    );
  }
}