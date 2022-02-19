void main(List<String> args) {
  int numeroDeCamadas = 5;

  print("Usando FOR");
  for (var i = 1; i <= 5; i++) {
    print("${'.' * i}${i}");
  }

  print("Usando WHILE");
  var count = 1;
  while (count <= numeroDeCamadas) {
    print("${'.' * count}${count}");
    count++;
  }
}
