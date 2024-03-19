import 'package:lista_de_tareas/models/Tarea.dart';


class TareaController {
  List<Tarea> tareas =[
    Tarea(
      titulo: "Actividad 2 movil", 
      descripcion: "Realizar aplicacion que contenga una lista de tareas", 
      estado: false),
    Tarea(
      titulo: "Videos de Gaming",
      descripcion: "Realizar y grabar los videos necesarios de Gaming and cultures",
      estado: false),
      Tarea(
      titulo: "Video de bullshit",
      descripcion: "Realizar y grabar los videos necesarios de Gaming and cultures",
      estado: true),
  ];

  List<Tarea> getTareas(){
  return tareas;
  }

  void agregarTarea(Tarea) {
    tareas.add(Tarea);
  }

  void eliminarTarea(int index) {
    if (index >= 0 && index < tareas.length) {
      tareas.removeAt(index);
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }
  int getTareasCompletadas() {
    return tareas.where((tarea) => tarea.estado == true).length;
  }
  void marcarTareaComoCompletada(int index, bool completada) {
    if (index >= 0 && index < tareas.length) {
      tareas[index].estado = completada;
    } else {
      throw Exception('Índice fuera de los límites de la lista de tareas');
    }
  }
}