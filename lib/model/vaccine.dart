import 'package:intl/intl.dart';

class Vaccine {
  Vaccine({
    required this.vacinaNome,
    required this.vacinaDataAplicacao,
    required this.pacienteEnderecoUf,
    required this.pacienteSexo,
  });

  final String
      vacinaNome,
      vacinaDataAplicacao,
      pacienteEnderecoUf,
      pacienteSexo;

  factory Vaccine.vaccineFromJSON(Map<String, dynamic> json) {
    return Vaccine(
      vacinaNome: json['vacina_nome'].toString(),
      vacinaDataAplicacao: json['vacina_dataAplicacao'].toString(),
      pacienteEnderecoUf: json['paciente_endereco_uf'].toString(),
      pacienteSexo: json['paciente_enumSexoBiologico'].toString(),
    );
  }

  factory Vaccine.seriesFromJSON(Map<String, dynamic> json) {
    //final dateParser = DateTime.parse(json['first_air_date']);
   // final dateFormatter = DateFormat('yMMM');
    //String finalDate = (dateFormatter.format(dateParser)).toString();
    return Vaccine(
      vacinaNome: json['vacina_nome'].toString(),
      vacinaDataAplicacao: json['vacina_dataAplicacao'].toString(),
      pacienteEnderecoUf: json['paciente_endereco_uf'].toString(),
      pacienteSexo: json['paciente_enumSexoBiologico'].toString(),
    );
  }
}
