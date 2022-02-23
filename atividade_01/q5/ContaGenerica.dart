abstract class ContaGenerica {
  String _correntista;
  double _saldo;
  bool pagaImposto;

  ContaGenerica(this._correntista, this._saldo, {this.pagaImposto = true});

  ContaGenerica.semImposto(this._correntista, this._saldo)
      : pagaImposto = false;

  double get saldo {
    return this._saldo;
  }

  String get correntista {
    return this._correntista;
  }
}
