class Cep {
  String? cep;
  String? logradouro;
  String? bairro;
  String? localidade;
  String? uf;
  String? ddd;

  Cep(
      {this.cep,
      this.logradouro,
      this.bairro,
      this.localidade,
      this.uf,
      this.ddd});

  Cep.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }
}
