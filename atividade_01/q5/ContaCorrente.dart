import 'ContaGenerica.dart';
import 'Tributavel.dart';

class ContaCorrente extends ContaGenerica implements Tributavel {
  ContaCorrente(String correntista, double saldo) : super(correntista, saldo);

  @override
  double calculaTributos() {
    return this.saldo * 0.10;
  }
}
