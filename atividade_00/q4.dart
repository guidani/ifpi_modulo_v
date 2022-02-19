class CalculaReajuste {
  double salarioMensal;
  double reajustePrimeiroAno = 0.07;
  double reajusteSegundoAno = 0.06;
  double reajusteTerceiroAno = 0.05;

  CalculaReajuste(this.salarioMensal) {}

  double primeiroReajuste() {
    double valorAjustado =
        this.salarioMensal + (this.salarioMensal * reajustePrimeiroAno);
    return valorAjustado;
  }

  double segundoReajuste() {
    double valorAjustado =
        primeiroReajuste() + (primeiroReajuste() * reajusteSegundoAno);
    return valorAjustado;
  }

  double terceiroReajuste() {
    double valorAjustado =
        segundoReajuste() + (segundoReajuste() * reajusteTerceiroAno);
    return valorAjustado;
  }
}

void main(List<String> args) {
  double salario = 5000;
  var reajuste = new CalculaReajuste(salario);
  print("""
        Valor do salário após o primeiro ano: R\$${reajuste.primeiroReajuste()}
        Valor do salário após o segundo ano: R\$${reajuste.segundoReajuste()}
        Valor do salário após o terceiro ano: R\$${reajuste.terceiroReajuste()}
  """);
}
