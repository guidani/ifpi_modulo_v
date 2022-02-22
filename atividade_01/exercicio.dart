import 'dart:math';
void main() {
  List<int> lista = [1,2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  int soma = lista.reduce((value, element) => value + element);
  int multiplicacao = lista.reduce((value, element) => value * element);
//   print("$soma','$multiplicacao");
  
  int funcSoma(List<int> array){
    var result = array.reduce((value, element) => value + element);
    return result;
  }
  
  int funcMultiplica(List<int> array){
    var result = array.reduce((value, element) => value * element);
    return result;
  }
  
  int funcExecute(List<int> array, Function func){
    return func(array);
  }
  
  num potenciaTradicional(int base, int expo){
    return pow(base, expo);
  }
  
  var potenciaArrow = (int base, int expo) => pow(base, expo);
  
  int teste(int a, int e){
    var result = a;
    for(var i = 1; i < e; i++){
      result *= a;
    }
    return result;
  }
  
  print(funcSoma(lista));
  print(funcMultiplica(lista));
  print(funcExecute(lista, funcSoma));
  print(funcExecute(lista, funcMultiplica));
  print(potenciaTradicional(4,4));
  print(potenciaArrow(3,9));
  print(teste(4,4));
}
