import 'ContaGenerica.dart';
import 'Tributavel.dart';

class ContaSemImposto extends ContaGenerica implements Tributavel{
  ContaSemImposto.semImposto(String correntista, double saldo) : super.semImposto(correntista, saldo);

  @override
  double calculaTributos() {
    return 0.0;
  }
}