import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/tasks_data.dart';



class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double  heightScreen = MediaQuery.of(context).size.height;
    String? newTask;
    return Padding(
      padding:  EdgeInsets.all(widthScreen*0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Your Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widthScreen*0.06,
              color: const Color(0xff3cc3ff),
            ),
          ),
           SizedBox(
            height: heightScreen*0.05,
          ),
          TextField(
            autocorrect: true,
            textAlign: TextAlign.center,
            onChanged: (newValue){
              newTask = newValue;
            },
          ),
           SizedBox(
               height: heightScreen*0.05,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TasksData>(context,listen: false).AddTask(newTask!);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xff3cc3ff),
              minimumSize:const Size.fromRadius(25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'Add Task',
            ),
          ),
        ],
      ),
    );
  }
}
