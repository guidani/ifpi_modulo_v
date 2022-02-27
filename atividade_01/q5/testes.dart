import 'AuditoriaInterna.dart';
import 'ContaCorrente.dart';
import 'ContaSemImposto.dart';
import 'Tributavel.dart';

void main(List<String> args) {
  var conta1 = ContaCorrente("João", 100);

  conta1.depositar(1200.50);
  print(conta1.saldo);

  conta1.sacar(200.00);
  print(conta1.saldo);

  var conta4 = ContaSemImposto.semImposto("guilherme", 10000);

  // Tributos
  var t = AuditoriaInterna();
  t.adicionar([conta1, conta4]);
  print("Total de tributos: ${t.calcularTributos()}");
}
