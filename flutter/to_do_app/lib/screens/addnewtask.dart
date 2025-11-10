import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/assets/constants/color.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/assets/constants/tasktype.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/service/todo_service.dart';

class Addnewtask extends StatefulWidget {
  final Function(Task) addNewTask;

  const Addnewtask({super.key, required this.addNewTask});

  @override
  _AddnewtaskState createState() => _AddnewtaskState();
}
class _AddnewtaskState extends State<Addnewtask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController userIdController= TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TodoService todoService=TodoService();
  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundcolor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                      image: AssetImage(
                          "lib/assets/images/Header2.png"),
                      fit: BoxFit.cover),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Add new task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10), child: Text("Task title")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Category"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.note;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category (1).png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.contest;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category (2).png"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("UserID"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: userIdController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Description"),
              ),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Task newTask =Task(
                      type: taskType, 
                      title: titleController.text, 
                      description: descriptionController.text, 
                      isCompleted: false);
                      widget.addNewTask(newTask);
                      Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
  void saveTodo(){
    Todo newTodo=
    Todo(
    id: -1, 
    todo: titleController.text, 
    completed: false, 
    userId: int.parse(userIdController.text));
    todoService.addTodo(newTodo);
  }
}