import 'package:intl/intl.dart';

class Vaccine {
  Vaccine(
      {required this.vacinaNome,
      required this.vacinaDataAplicacao,
      required this.pacienteEnderecoUf,
      required this.pacienteSexo,
      required this.pacienteRaca});

  final String vacinaNome, pacienteEnderecoUf, pacienteRaca, pacienteSexo;
  final DateTime vacinaDataAplicacao;

  factory Vaccine.vaccineFromJSON(Map<String, dynamic> json) {
    final dateParser = DateTime.parse(json['vacina_dataAplicacao']);
    return Vaccine(
      vacinaNome: json['vacina_nome'].toString(),
      vacinaDataAplicacao: dateParser,
      pacienteEnderecoUf: json['paciente_endereco_uf'].toString(),
      pacienteSexo: json['paciente_enumSexoBiologico'].toString(),
      pacienteRaca: json['paciente_racaCor_codigo'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        '"vacina_nome"': '"${vacinaNome}"',
        '"paciente_endereco_uf"': '"${pacienteEnderecoUf}"',
        '"paciente_enumSexoBiologico"': '"${pacienteSexo}"',
        '"paciente_racaCor_codigo"': '"${pacienteRaca}"',
        '"vacina_dataAplicacao"': '"${vacinaDataAplicacao}"',
      };
}
