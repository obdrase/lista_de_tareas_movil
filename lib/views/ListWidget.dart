import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lista_de_tareas/controllers/TareaController.dart';
import 'package:lista_de_tareas/models/Tarea.dart';
import 'package:lista_de_tareas/views/AgregarTarea.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidget createState() => _ListWidget(); 
}

class _ListWidget extends State<ListWidget> {
  final TareaController _tareaController = TareaController();
  List<Tarea> tareas = [];

  @override
  void initState() {
    super.initState();
    tareas = _tareaController.getTareas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tareas Pendientes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                if (!tareas[index].estado) {
                  return _buildTareaItem(tareas[index]);
                } else {
                  return SizedBox.shrink(); // Devuelve un widget sin espacio si no se cumple la condición
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tareas Completadas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                if (tareas[index].estado) {
                  return _buildTareaItem(tareas[index]);
                } else {
                  return SizedBox.shrink(); // Devuelve un widget sin espacio si no se cumple la condición
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgregarTarea(
                onTareaAdded: (newTarea) {
                  setState(() {
                    tareas.add(newTarea);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTareaItem(Tarea tarea) {
    return ListTile(
      title: Text(tarea.titulo),
      subtitle: Text(tarea.descripcion),
      leading: Checkbox(
        value: tarea.estado,
        onChanged: (value) {
          setState(() {
            _tareaController.marcarTareaComoCompletada(tareas.indexOf(tarea), value ?? false);
          });
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _tareaController.eliminarTarea(tareas.indexOf(tarea));
            tareas = _tareaController.getTareas();
          });
        },
      ),
    );
  }
}
