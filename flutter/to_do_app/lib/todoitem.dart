import 'package:flutter/material.dart';
import 'package:to_do_app/assets/constants/tasktype.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key,required this.task});
  final Todo task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? const Color.fromARGB(255, 189, 189, 189): Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            widget.task.type == TaskType.note ? Image.asset("lib/assets/images/Category.png") 
            : widget.task.type == TaskType.contest 
              ?Image.asset("lib/assets/images/Category (1).png") 
                : Image.asset("lib/assets/images/Category (2).png"),
                */
              Image.asset("lib/assets/images/Category.png"),
            Expanded(
              child: Column(children: [
                Text(
                widget.task.todo!,
                style: TextStyle(
                  decoration: widget.task.completed! ? TextDecoration.lineThrough : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                Text("User"+ widget.task.userId!.toString(),style: TextStyle(decoration: widget.task.completed! ? TextDecoration.lineThrough : TextDecoration.none),)
              ],),
            ),      
            Checkbox(
                value: isChecked,
                onChanged: (val) => {
                      setState(() {
                        widget.task.completed =!widget.task.completed!;
                        isChecked = val!;
                      })
                    })
          ],
        ),
      ),
    );
  }
}
