import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/task_inherited.dart';
import 'package:primeiro_projeto_flutter/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(color: Colors.black26),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: TaskInherited.of(context)!.taskList,
      ),
      // ignore: sized_box_for_whitespace
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, // context da nossa tela inicial
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                  taskContext:
                      context), // coloco o parâmetro e digo qual o contexto. Seleciono o contexto da minha tela inicial, que é o context
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
