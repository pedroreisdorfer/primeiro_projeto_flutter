import 'package:flutter/material.dart';

import '../components/task.dart';

// nosso TaskInherited precisa ser pai do widget que engloba as tarefas
// pois quero manipular essas informações
class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task(
      "Aprender Flutter",
      'assets/images/sheet.png',
      0,
    ),
    Task("Aprender Poker", 'assets/images/icons8-flutter-64.png', 2),
    Task("Aprender backend", 'assets/images/flutter_1.png', 4),
    Task("Aprender backend", 'assets/images/flutter_2.png', 5),
    Task("Aprender backend", 'assets/images/flutter_3.png', 3),
    Task("Aprender backend", 'assets/images/flutter_4.png', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    // posso mudar o "of" para outro nome
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  // updateShouldNotify é quem fica de olho no estado da nossa informação.
  // que no caso é nossa lista de tarefas. Ele precisa de outro widget, pq ele
  // fica de olho no estado anterior da informação em questão
  // a questão é que quero notificar as listas de tarefas apenas quando houver uma mudança concreta no enredo
  bool updateShouldNotify(TaskInherited oldWidget) {
    // oldwidget é o estado anterior  da nossa info
    return oldWidget.taskList.length != taskList.length;
  }
}
// aqui se encontra um widget para manipular informações
