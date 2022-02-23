class AuditoriaInterna {
  List tributaveis = [];

  AuditoriaInterna();

  void adicionar(List tributaveis) {
    this.tributaveis.addAll(tributaveis);
  }

  double calcularTributos() {
    double total = 0;
    this.tributaveis.forEach((element) {
      total += element.calculaTributos();
    });
    return total;
  }
}
