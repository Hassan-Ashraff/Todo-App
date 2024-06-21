import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/tasks_data.dart';



class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    String? new_task;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Your Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff3cc3ff),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              onChanged: (newValue){
                new_task = newValue;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TasksData>(context,listen: false).AddTask(new_task!);
                Navigator.pop(context);
              },
              child: Text(
                'Add Task',
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff3cc3ff),
                minimumSize:Size.fromRadius(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
