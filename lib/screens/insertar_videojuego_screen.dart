import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class InsertarVideojuegoScreen extends StatefulWidget {
  const InsertarVideojuegoScreen({super.key});

  @override
  State<InsertarVideojuegoScreen> createState() => _InsertarVideojuegoScreenState();
}

class _InsertarVideojuegoScreenState extends State<InsertarVideojuegoScreen> {

  TextEditingController videojuegoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertar videojuego'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: videojuegoController,
              decoration: InputDecoration(
                hintText: 'Insertar un videojuego'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                //print(videojuegoController.text);
                await insertarVideojuego(videojuegoController.text).then((_){
                  Navigator.pop(context);
                });
              }, 
              child: Text('Guardar') 
            ),
          ],
        ),
      ),
    );
  }
}