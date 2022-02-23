int funcSoma(List<int> array) {
  var result = array.reduce((value, element) => value + element);
  return result;
}

int funcMultiplica(List<int> array) {
  var result = array.reduce((value, element) => value * element);
  return result;
}

int funcExecute(List<int> array, Function func) {
  return func(array);
}

void main() {
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print("Soma dos elementos: ${funcExecute(lista, funcSoma)}");
  print("multiplicação dos elementos: ${funcExecute(lista, funcMultiplica)}");
}
