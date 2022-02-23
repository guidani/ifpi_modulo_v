  int funcMultiplica(List<int> array){
    var result = array.reduce((value, element) => value * element);
    return result;
  }

void main() {
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print("Multiplicação dos elementos: ${funcMultiplica(lista)}");
}
