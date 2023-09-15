import 'package:flutter/material.dart';
import 'package:hive_app_example/data/models/boxes.dart';
import 'package:hive_app_example/data/models/task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskStatusController = TextEditingController();
  Color colors = Colors.grey;
  String taskName = "";
  String taskStatus = "";

  List<Task> tasks = [];
  List<Task> filteredList = [];
  List<Task> result = [];
  late Task task;

  @override
  void initState() {
    super.initState();
    getElements();
    filteredList = tasks;
  }

  void _onSearched(String value) {
    result = [];
    if (value.isEmpty) {
      result = tasks;
    } else {
      result =
          tasks.where((element) => element.taskName.contains(value)).toList();
      print(filteredList.length);
    }
    setState(() {
      filteredList = result;
    });
  }

  void getElements() {
    setState(() {
      tasks.clear();
      for (int i = 0; i < boxTasks.length; i++) {
        tasks.add(boxTasks.getAt(i));
      }
      tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _taskNameController,
                    ),
                    TextField(
                      controller: _taskStatusController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            boxTasks.put(
                                'key_${_taskNameController.text}',
                                Task(
                                    taskName: _taskNameController.text,
                                    taskStatus:
                                        _taskStatusController.text));
                            //print(boxTasks.length);
                            tasks.clear();
                            for (int i = 0; i < boxTasks.length; i++) {
                              tasks.add(boxTasks.getAt(i));
                            }
                            print(tasks.length);
                            _taskNameController.clear();
                            _taskStatusController.clear();
                          });
                        },
                        child: Text("Add Task")),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber.shade50,
                ),
                child: TextField(
                  onChanged: (value) => _onSearched(value),
                  decoration: InputDecoration(
                      hintText: "Search by task name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber.shade50,
                  ),
                  child: filteredList.isEmpty
                      ? Center(
                          child: Text("no data"),
                        )
                      : ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: IconButton(
                                  onPressed: () {
                                    if (filteredList[index].taskStatus ==
                                        "not completed") {
                                      setState(() {
                                        boxTasks.putAt(
                                            index,
                                            Task(
                                                taskName: tasks[index].taskName,
                                                taskStatus: "completed"));
                                        //print(boxTasks.getAt(index));
                                        tasks.removeAt(index);
                                        print(tasks.length);
                                        tasks.insert(
                                            index, boxTasks.getAt(index));
                                        print(tasks.length);
                                        //colors = Colors.green;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.check,
                                    color: colors,
                                  )),
                              title: Text(filteredList[index].taskName,overflow: TextOverflow.ellipsis,),
                              subtitle: Text(filteredList[index].taskStatus,overflow: TextOverflow.ellipsis,),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      boxTasks.deleteAt(index);
                                      tasks.removeAt(index);
                                      print(tasks.length);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                            );
                          })),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
