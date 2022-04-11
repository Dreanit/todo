import 'package:get/get.dart';
import 'package:todo/database/db_helper.dart';
import 'package:todo/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;
  @override
  void onReady() {
    getTasks();
    sortTasks();
    super.onReady();
  }



  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  Future<void> getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((task) => Task.fromJson(task)).toList());

  }
  void delete(Task task){
    DBHelper.delete(task);
    getTasks();

  }
  void markTaskCompleted(int id)async{
    await DBHelper.update(id);

    getTasks();
  }
  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTasks();
  }
  void sortTasks()async{
    await DBHelper.order();
  }
}