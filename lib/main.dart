import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/task_inherited.dart';
import 'package:primeiro_projeto_flutter/screens/initialScreen.dart';

void main() {
  runApp(const MyApp()); // que faz o flutter rodar no Emulador
  // tudo que está dentro do runApp vai rodar no nosso Aplicativo
}

class MyApp extends StatelessWidget {
  //extends é herança
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(
          child:
              const InitialScreen()), // aqui estou definindo que TaskInherited é a mãe de todos no projeto
    );
  }
}
