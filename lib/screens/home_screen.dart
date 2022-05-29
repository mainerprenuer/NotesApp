import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_todo/screens/add_task.dart';
import 'package:go_todo/screens/all_tasks.dart';
import 'package:go_todo/utils/app_colors.dart';
import 'package:go_todo/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Salaam..",
                    style: TextStyle(
                        color: Color.fromARGB(235, 245, 145, 4),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: "\nStart your beautiful day",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 20,
                      ))
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => const AllTasks(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 500));
                },
                child: const ButtonWidget(
                    backgroundcolor: Color.fromARGB(255, 6, 6, 114),
                    text: "Add Task",
                    textColor: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => const AddTask(),
                      transition: Transition.zoom,
                      duration: const Duration(seconds: 1));
                },
                child: const ButtonWidget(
                    backgroundcolor: Color.fromARGB(255, 254, 254, 254),
                    text: "View All",
                    textColor: Colors.blueGrey)),
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome1.jpg"))),
      ),
    );
  }
}
