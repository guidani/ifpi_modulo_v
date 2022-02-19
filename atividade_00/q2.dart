class ShowDate {
  final data = DateTime.now();

  int? dia;
  int? mes;
  int? ano;

  ShowDate() {
    this.dia = data.day;
    this.mes = data.month;
    this.ano = data.year;
  }

  String message() {
    var diaAtual = this.dia!.toInt() < 10 ? "0${this.dia}" : this.dia;
    var mesAtual = this.mes!.toInt() < 10 ? "0${this.mes}" : this.mes;
    var anoAtual = this.ano!.toInt() < 10 ? "0${this.ano}" : this.ano;
    return "Data atual: ${diaAtual.toString()}/${mesAtual.toString()}/${anoAtual.toString()}";
  }

  void dataCompleta() {
    print(data.day);
    print(data.month);
    print(data.year);
    print(data);
  }
}

void main(List<String> args) {
  var d = new ShowDate();

  print(d.message());
}
