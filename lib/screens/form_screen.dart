import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // State é o que fica de olho no estado do objet0
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // a chave fica de olho no estado do formulário
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome da tarefa';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            nameController, // controller dentro do TextFromField controla o texto que está sendo editado
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true), // hintText é texto de dica
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (difficultyValidator(value)) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller:
                            difficultyController, // controller dentro do TextFromField controla o texto que está sendo editado
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            fillColor: Colors.white70,
                            filled: true), // hintText é texto de dica
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira um url de imagem!';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.url,
                        controller:
                            imageController, // controller dentro do TextFromField controla o texto que está sendo editado
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true), // hintText é texto de dica
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/cameraNot.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(context)?.newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text));
                          ScaffoldMessenger.of(widget.taskContext).showSnackBar(
                              // aqui estamos pegando o contexto que é trazido para nosso formulário
                              const SnackBar(
                                  content: Text('Criando nova tarefa')));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Adicionar'),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
