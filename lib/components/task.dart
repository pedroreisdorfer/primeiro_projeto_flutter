import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/difficulty.dart';
import 'dart:math';

class Task extends StatefulWidget {
  // as  variáveis que estão aqui no Task buscamos com widget.nome, por exemplo
  final String nome;
  final String imagem;
  final int dificuldade;
  Task(this.nome, this.imagem, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double progressValue = 0;

  bool assetOrNetwork() {
    if (widget.imagem.contains('http')) {
      return false;
    }
    return true;
  }

  void upgradeProgress(int dificuldade_) {
    setState(() {
      dificuldade_ = widget.dificuldade;
      widget.nivel++;
      if (progressValue == 1) {
        widget.nivel = 0;
      }
      if (dificuldade_ == 0) {
        progressValue = 1;
      } else {
        progressValue = (widget.nivel / dificuldade_) / 10;
      }
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Defina 255 para opacidade total (sem transparência)
      random.nextInt(256), // Vermelho (0-255)
      random.nextInt(256), // Verde (0-255)
      random.nextInt(256), // Azul (0-255)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: progressValue == 1 && widget.dificuldade == 0
                    ? Colors.blue
                    : progressValue == 1
                        ? getRandomColor()
                        : Colors.blue,
                borderRadius: BorderRadius.circular(5)),
            height: 150,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 233, 233),
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(5)),
                        width: 75,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.imagem,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.imagem,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Difficulty(
                              difficultyLevel: widget.dificuldade,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SizedBox(
                              height: 52,
                              width: 52,
                              child: ElevatedButton(
                                  onPressed: () {
                                    upgradeProgress(widget.dificuldade);
                                  },
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.arrow_drop_up),
                                      Text(
                                        "Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: progressValue,
                        )),
                    Text(
                      "Nível: ${widget.nivel}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
