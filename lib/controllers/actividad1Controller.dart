// ignore_for_file: file_names

import 'dart:convert';
import 'package:actividadad1_pacientes/models/actividad1.dart';

void main() {
  // Sexo (1. Hombre, 2. Mujer)
  // Estado civil (1. Soltero, 2. Casado, 3. Viudo)
  String pacientesJson = '''
    [
      {"sexo": 1, "estadoCivil": 1, "edad": 25},
      {"sexo": 1, "estadoCivil": 2, "edad": 35},
      {"sexo": 1, "estadoCivil": 1, "edad": 30},
      {"sexo": 2, "estadoCivil": 1, "edad": 20},
      {"sexo": 2, "estadoCivil": 3, "edad": 40},
      {"sexo": 1, "estadoCivil": 2, "edad": 45},
      {"sexo": 2, "estadoCivil": 1, "edad": 22},
      {"sexo": 1, "estadoCivil": 1, "edad": 28},
      {"sexo": 1, "estadoCivil": 2, "edad": 50},
      {"sexo": 2, "estadoCivil": 2, "edad": 32},
      {"sexo": 1, "estadoCivil": 3, "edad": 60},
      {"sexo": 2, "estadoCivil": 1, "edad": 25},
      {"sexo": 1, "estadoCivil": 2, "edad": 55},
      {"sexo": 1, "estadoCivil": 1, "edad": 29},
      {"sexo": 2, "estadoCivil": 1, "edad": 21}
    ]
  ''';

  // Convertir cadena JSON en una lista de mapas
  List<dynamic> pacientesList = jsonDecode(pacientesJson);

  // Crear lista de pacientes utilizando el constructor nombrado
  List<Paciente> pacientes = pacientesList.map((json) => Paciente.fromJson(json: json)).toList();

  int hombresSolteros = 0;
  int sumaEdadesHombresCasados = 0;
  int mujeresSolteras = 0;
  int totalHombres = 0;
  int totalSolteros = 0;

  // Sexo (1. Hombre, 2. Mujer)
  // Estado civil (1. Soltero, 2. Casado, 3. Viudo)
  for (var paciente in pacientes) {
    if (paciente.sexo == 1) {
      totalHombres++;

      if (paciente.estadoCivil == 1) {
        hombresSolteros++;
        totalSolteros++;

      } else if (paciente.estadoCivil == 2) {
        sumaEdadesHombresCasados += paciente.edad;
      }
    } else if (paciente.sexo == 2 && paciente.estadoCivil == 1) {
      mujeresSolteras++;
      totalSolteros++;
    }
  }

  double porcentajeHombresSolteros = (hombresSolteros / totalHombres) * 100;
  double edadPromedioHombresCasados = sumaEdadesHombresCasados / totalHombres;
  double porcentajeMujeresSolteras = (mujeresSolteras / totalSolteros) * 100;

  print('Porcentaje de hombres solteros: $porcentajeHombresSolteros%');
  print('Edad promedio de hombres casados: $edadPromedioHombresCasados años');
  print('Porcentaje de mujeres solteras: $porcentajeMujeresSolteras%');
}
