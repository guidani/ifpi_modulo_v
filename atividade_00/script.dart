import 'dart:math';

class Operations {
  double n1;
  double n2;

  Operations(this.n1, this.n2) {}

  // letra a
  double resto() {
    return this.n2 % this.n1;
  }

  // letra b
  int divide() {
    return n1 ~/ n2;
  }

  num exponential() {
    return pow(this.n1, this.n2);
  }

  bool eh_inteiro() {
    return this.n1 is int;
  }

  bool nao_eh_inteiro() {
    return this.n1 is! int;
  }
}

void main() {
  var resultado = Operations(3, 10);
  print("Resto: ${resultado.resto()}");
  print("Divisão: ${resultado.divide()}");
  print("Exponencial: ${resultado.exponential()}");
  print("É inteiro?: ${resultado.eh_inteiro()}");
  print("Não é inteiro?: ${resultado.nao_eh_inteiro()}");
}
