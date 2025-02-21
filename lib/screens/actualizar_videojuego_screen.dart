import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class ActualizarVideojuegoScreen extends StatefulWidget {
  const ActualizarVideojuegoScreen({super.key});

  @override
  State<ActualizarVideojuegoScreen> createState() => _ActualizarVideojuegoScreenState();
}

class _ActualizarVideojuegoScreenState extends State<ActualizarVideojuegoScreen> {

  TextEditingController videojuegoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {

    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    videojuegoController.text = argumentos['nombre'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar videojuego'),
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
                await actualizarVideojuego(argumentos['uid'], videojuegoController.text);
              }, 
              child: Text('Actualizar') 
            ),
          ],
        ),
      ),
    );
  }
}