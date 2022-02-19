void main(List<String> args) {
  List lista = <int>[1, 2, 3, 4, 5];

  print(lista.runtimeType);

  lista.forEach((element) {
    print(element *= 2);
  });
}
