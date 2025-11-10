import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/assets/constants/color.dart';
import 'package:to_do_app/assets/constants/tasktype.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/screens/addnewtask.dart';
import 'package:to_do_app/service/todo_service.dart';
import 'package:to_do_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<Task> todo=[
      Task(
      type: TaskType.note, 
      title: "Study Lessons", 
      description: "Study Spanish", 
      isCompleted: false),
      Task(
      type: TaskType.calendar, 
      title: "Go to party", 
      description: "At 5pm", 
      isCompleted: false),
      Task(
      type: TaskType.contest, 
      title: "Run 5K", 
      description: "Run 5 kilometers", 
      isCompleted: false)];
    List<Task> completed=[
      Task(
      type: TaskType.note, 
      title: "Study Lessons", 
      description: "Study Spanish", 
      isCompleted: false),
      Task(
      type: TaskType.calendar, 
      title: "Go to party", 
      description: "At 5pm", 
      isCompleted: false),
    ];
    void addNewTask(Task newTask){
      setState(() {
        todo.add(newTask);
      });
    }
  @override
  Widget build(BuildContext context) {
    //List<String> todo= ["Study lessons","Run 5k","Go to party"];
    //List<String> completed =["Game meetup","Take out trash"];
    TodoService todoService= TodoService();
    todoService.getUncompletedTodos();
    double deviceHeight= MediaQuery.of(context).size.height;
    double deviceWidth= MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundcolor),
          body: Column(
            children: [
            Container(
              width: deviceWidth,
              height: deviceHeight/3,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/Header.png"),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("July 16, 2024", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text("My To Do List", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),),
                  ),
              ],
              ),
              ),
            //header
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 00, 20, 5),
                  child: SingleChildScrollView( 
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder:(context, snapshot){
                        print(snapshot.data);
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const CircularProgressIndicator();
                        }
                        else{
                           return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                        return Todoitem(task: snapshot.data![index],);
                      }
                      );
                        }
                    },
                    ), 
                  ),
                ),
              ),
              //top column
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Completed", 
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ),
              //completed text
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 00, 20, 5),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getCompletedTodos(),
                      builder:(context, snapshot){
                        print(snapshot.data);
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const CircularProgressIndicator();
                        }
                        else{
                           return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                        return Todoitem(task: snapshot.data![index],);
                      }
                      );
                        }
                    },
                    ), 
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Addnewtask(
                    addNewTask: (newTask) => addNewTask(newTask),
                  ),)
                );
              }, child: Text("Add New Task"))
              ],
              //bottom column
          ),
        ),
      ),
    );
  }
}