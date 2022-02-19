void main(List<String> args) {
  var a = null;
  var b = 12;
  var res = a ?? b;
  print(res);
  print("""
Explicação
linha 2: a é inicializado como null
linha 3: atribui 12 a variável b
linha 4: verifica se a é null com o operador (??) lê-se 'if null', se for true então atribuid a variável res o valor de b.
""");
}
