class Paciente {
  int sexo = 0;
  int estadoCivil = 0;
  int edad = 0;

  Paciente({required this.sexo, required this.estadoCivil, required this.edad});

  Paciente.fromJson(Map<String, dynamic> json) {
    sexo = json['sexo'];
    estadoCivil = json['estadoCivil'];
    edad = json['edad'];
  }
}
