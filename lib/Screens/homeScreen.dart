import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/tasks_data.dart';
import 'package:todo_app/Screens/addTaskScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
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
                    child: AddTask(),
                  ));
                });
          },
          backgroundColor: Color(0xff3cc3ff),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff3cc3ff),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.list,
                            color: Color(0xff3cc3ff),
                            size: 35,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ToDoey',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<TasksData>(builder: (context, TaskData, child) {
                        return Text(
                          '${TaskData.Tasks.length} tasks',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<TasksData>(
                          builder: (context, TaskData, child) {
                        return ListView.builder(
                            itemCount: TaskData.Tasks.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: Checkbox(
                                  value: TaskData.Tasks[index].isDone,
                                  onChanged: (v) {

                                      TaskData.Check(TaskData.Tasks[index]);


                                  },
                                ),
                                title: Text(TaskData.Tasks[index].name,style: TextStyle(fontWeight: FontWeight.w400,),),
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
          ),
        )));
  }
}
