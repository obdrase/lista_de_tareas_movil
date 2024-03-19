import 'package:flutter/material.dart';
import 'package:lista_de_tareas/controllers/TareaController.dart';
import 'package:lista_de_tareas/models/Tarea.dart';

class AgregarTarea extends StatefulWidget {
  final Function(Tarea) onTareaAdded;

  AgregarTarea({required this.onTareaAdded});

  @override
  _AgregarTareaState createState() => _AgregarTareaState();
}

class _AgregarTareaState extends State<AgregarTarea> {
  final TareaController _tareasController = TareaController();
  late TextEditingController tituloController;
  late TextEditingController descripcionController;
  bool intentoGuardar = false;

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController();
    descripcionController = TextEditingController();
  }

  @override
  void dispose() {
    tituloController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: false,
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
                errorText: intentoGuardar && tituloController.text.isEmpty ? "Campo requerido" : null,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: "Descripción de la tarea",
                errorText: intentoGuardar && descripcionController.text.isEmpty ? "Campo requerido" : null,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  intentoGuardar = true;
                  String titulo = tituloController.text;
                  String descripcion = descripcionController.text;
                  if (!titulo.isEmpty || !descripcion.isEmpty) {
                    Tarea nuevaTarea = Tarea(
                      titulo: titulo,
                      descripcion: descripcion,
                      estado: false,
                    );
                    _tareasController.agregarTarea(nuevaTarea);
                    widget.onTareaAdded(nuevaTarea);
                    Navigator.pop(context);
                  } 
                });
              },
              child: Text("Guardar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
