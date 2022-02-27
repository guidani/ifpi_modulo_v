import 'ContaGenerica.dart';
import 'Tributavel.dart';

class ContaCorrente extends ContaGenerica implements Tributavel {
  ContaCorrente(String correntista, double saldo) : super(correntista, saldo);

  @override
  double calculaTributos() {
    return this.saldo * 0.10;
  }

  @override
  double sacar(double valor) {
    double taxa = valor * 0.05;
    return super.sacar(valor - taxa);
  }
}
