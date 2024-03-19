import 'package:flutter/material.dart';
import 'package:lista_de_tareas/controllers/TareaController.dart';
import 'package:lista_de_tareas/models/Tarea.dart';

class AgregarTarea extends StatelessWidget {
  final TareaController _tareasController = TareaController();
  final Function(Tarea) onTareaAdded;

  AgregarTarea({required this.onTareaAdded});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      
    );
  }
}
