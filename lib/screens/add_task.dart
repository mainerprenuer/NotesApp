import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_todo/widgets/textfield_widget.dart';
import '../widgets/button_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const  EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image:DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/header1.jpg"
            )
          )
           ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:  [
                const SizedBox(height: 40,),
                IconButton(onPressed: (){
                  Get.back();
                }, 
                  icon: const Icon(Icons.arrow_back,
                  color: Colors.white,
                ),)
              ]),
            Column(
              children:  [
               TextFieldWidget(textController: nameController, 
                    hintText: "Task name"),
               const SizedBox(height: 20,),
               TextFieldWidget(textController: detailController, 
                    hintText: "Task detail", 
                    borderRadius: 15,
                    maxLines: 3,),
                const SizedBox(height: 20,),
               const ButtonWidget(backgroundcolor: Color.fromARGB(255, 6, 6, 114),
                    text: "Add", textColor: Colors.white),
                        ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            )
          ],
        ),
      ),
    );
  } 
}
