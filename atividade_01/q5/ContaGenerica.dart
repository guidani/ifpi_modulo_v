abstract class ContaGenerica {
  String _correntista;
  double _saldo;

  ContaGenerica(this._correntista, this._saldo);

  double get saldo {
    return this._saldo;
  }

  String get correntista{
    return this._correntista;
  }
}
