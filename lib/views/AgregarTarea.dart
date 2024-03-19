import 'package:flutter/material.dart';
import 'package:lista_de_tareas/controllers/TareaController.dart';
import 'package:lista_de_tareas/models/Tarea.dart';

class AgregarTarea extends StatelessWidget {
  final TareaController _tareasController = TareaController();
  final Function(Tarea) onTareaAdded;

  AgregarTarea({required this.onTareaAdded});

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Tarea",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: "Título de la tarea",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: "Descripción de la tarea",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String titulo = tituloController.text;
                String descripcion = descripcionController.text;
                if (!titulo.isEmpty && !descripcion.isEmpty) {
                  Tarea nuevaTarea = Tarea(
                    titulo: titulo,
                    descripcion: descripcion,
                    estado: false,
                  );
                  _tareasController.agregarTarea(nuevaTarea);
                  onTareaAdded(nuevaTarea);
                  Navigator.pop(context);
                }
              },
              child: Text("Guardar"),
            ),
            
          ],
        ),
      ),
    );
  }
}
