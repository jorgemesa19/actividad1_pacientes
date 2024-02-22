class Paciente {
  int sexo = 0;
  int estadoCivil = 0;
  int edad = 0;

  Paciente();

  Paciente.fromJson({required Map<String, dynamic> json}) {
    sexo = json["sexo"];
    estadoCivil = json["estadoCivil"];
    edad = json["edad"];
  }
}
