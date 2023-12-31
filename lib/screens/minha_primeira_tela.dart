import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.yellow,
              width: 50,
              height: 50,
            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.yellow,
              width: 50,
              height: 50,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.cyan,
              height: 2,
              width: 50,
            ),
            Container(
              color: Colors.pinkAccent,
              height: 2,
              width: 50,
            ),
            Container(
              color: Colors.orange,
              height: 2,
              width: 50,
            ),
          ],
        ),
        Container(
          color: Colors.amber,
          height: 30,
          width: 300,
          child: const Text(
            'Diamante Amarelo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print('Você apertou o botão');
            },
            child: const Text('Aperte o botão!'))
      ]),
    );
  }
}
