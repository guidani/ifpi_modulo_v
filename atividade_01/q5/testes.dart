import 'AuditoriaInterna.dart';
import 'ContaCorrente.dart';
import 'Tributavel.dart';

void main(List<String> args) {
  var conta1 = ContaCorrente("João", 100);
  var conta2 = ContaCorrente("Maria", 200);
  var conta3 = ContaCorrente("José", 300);
  print(conta1.calculaTributos());
  print(conta2.calculaTributos());
  print(conta3.calculaTributos());

  // Tributos
  var t = AuditoriaInterna();
  t.adicionar([conta1, conta2, conta3]);
  print("Total de tributos: ${t.calcularTributos()}");
}
