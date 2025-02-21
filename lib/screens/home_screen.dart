import 'package:flutter/material.dart';
import 'package:flutter_crud/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getVideojuegos(), 
        builder: ((context, snapshot) {

          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {
                    
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;

                    result = await showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          title: Text("¿Seguro que desea eliminar el ${snapshot.data?[index]['nombre']}?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, false);
                              }, 
                              child: Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, true);
                              }, 
                              child: Text("Borrar"),
                            )
                          ],
                        );
                      }
                    );

                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                    title: Text(snapshot.data?[index]['nombre']),
                    onTap: () async {
                      await Navigator.pushNamed(context, "actualizar", arguments: {
                        "nombre": snapshot.data?[index]['nombre'],
                        "uid": snapshot.data?[index]['uid'],
                      });
                      setState(() {});
                    },
                  ),
                ); 
                  //
              },
            );
          } else {
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, 'insertar');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}