class CalculaMedia {
  double nota1 = 0;
  double nota2 = 0;
  double nota3 = 0;

  CalculaMedia(nota1, nota2, nota3) {
    this.nota1 = nota1;
    this.nota2 = nota2;
    this.nota3 = nota3;
  }

  double media() {
    double resultado = (this.nota1 + this.nota2 + this.nota3) / 3;
    return resultado;
  }

  String resultado() {
    return this.media() >= 7.0
        ? "aprovado"
        : this.media() < 4
            ? "reprovado"
            : "exame final";
  }
}

void main() {
  double nota1 = 3;
  double nota2 = 4;
  double nota3 = 4;

  var calculoMedia = CalculaMedia(nota1, nota2, nota3);
  var minhaMedia = calculoMedia.media().toStringAsFixed(2);
  var meuResultado = calculoMedia.resultado();
  print("Nota: ${minhaMedia}\nResultado: ${meuResultado}");
}
