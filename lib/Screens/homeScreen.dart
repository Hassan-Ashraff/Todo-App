
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/tasks_data.dart';
import 'package:todo_app/Screens/addTask_Screen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {
  @override
  void initState(){
    super.initState();
    Provider.of<TasksData>(context,listen: false).loadTasks();


  }

  @override
  Widget build(BuildContext context) {
   double widthScreen = MediaQuery.of(context).size.width;
   double  heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AddTask(),
                  ));
                });
          },
          backgroundColor: const Color(0xff3cc3ff),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff3cc3ff),
        body: SafeArea(
            child: SizedBox(
              width: widthScreen,
              height: heightScreen,
              child: Column(
                children: [
                   SizedBox(
                    height: heightScreen*0.03,
                  ),
                  InkWell(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.03,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: widthScreen*0.07,
                              child: Icon(
                                Icons.list,
                                color: const Color(0xff3cc3ff),
                                size: widthScreen*0.09,
                              )),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: heightScreen*0.01,
                  ),
                  SizedBox(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.03),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ToDoey',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widthScreen*0.1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: heightScreen*0.01,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<TasksData>(builder: (context, TaskData, child) {
                          return Text(
                            '${TaskData.Tasks.length} tasks',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: widthScreen*0.055),
                          );
                        }),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: heightScreen*0.03,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(widthScreen*0.03),
                        child: Consumer<TasksData>(
                            builder: (context, TaskData, child) {
                          return ListView.builder(
                              itemCount: TaskData.Tasks.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: Checkbox(
                                    side: const BorderSide(color: Color(0xff3cc3ff)),
                                    activeColor: Colors.white,
                                    checkColor:const Color(0xff3cc3ff),
                                    value: TaskData.Tasks[index].isDone,
                                    onChanged: (value) {

                                        TaskData.Check(TaskData.Tasks[index]);


                                    },
                                  ),
                                  title:
                                  Text(TaskData.Tasks[index].name,style: TextStyle( color: TaskData.Tasks[index].isDone ? Colors.grey : Colors.black,
                                    decoration: TaskData.Tasks[index].isDone ? TextDecoration.lineThrough : TextDecoration.none,
                                    decorationColor: const Color(0xff3cc3ff),
                                    fontWeight: FontWeight.w400,fontSize: widthScreen*0.04,),),
                                    onLongPress:(){
                                        TaskData.DeleteTask(TaskData.Tasks[index]);
                                    }
                                );
                              }
                              );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
