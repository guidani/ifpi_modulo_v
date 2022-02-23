import 'dart:math';

num potenciaTradicional(int base, int expo) {
  return pow(base, expo);
}

var potenciaArrow = (int base, int expo) => pow(base, expo);

int usandoFor(int a, int e) {
  var result = a;
  for (var i = 1; i < e; i++) {
    result *= a;
  }
  return result;
}

void main(List<String> args) {
  print("Método tradicional: ${potenciaTradicional(4, 4)}");
  print("Usando arrow function: ${potenciaArrow(3, 9)}");
  print("Usando função própria com FOR: ${usandoFor(4, 4)}");
}
