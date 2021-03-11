import 'dart:math';

class CalculadoraIMC {
  double altura;
  double peso;

  CalculadoraIMC(double alturaParametro, double peso) {
    this.altura = alturaParametro;
    this.peso = peso;
  }

  double calcular() {
    var resultado = peso / pow(altura, 2);
    return resultado;
  }

  String classificar() {
    var imc = calcular();
    var resultado = 'IMC: ' + imc.toStringAsPrecision(4) + '\n';

    if (imc < 16) { 
      resultado += 'Magreza grave'; 
    }
    else if (imc >= 16 && imc < 17) {
      resultado += 'Magreza moderada';
    }
    else if (imc >= 17 && imc < 18.5) {
      resultado += 'Magreza leve';
    }
    else if (imc >= 18.5 && imc < 25) {
      resultado += 'Saudável';
    }
    else if (imc >= 25 && imc < 30) {
      resultado += 'Sobrepeso';
    }
    else if (imc >= 30 && imc < 35) {
      resultado += 'Obesidade Grau I';
    }
    else if (imc >= 35 && imc < 40) {
      resultado += 'Obesidade Grau II (considerada severa)';
    }
    else { //Maior que 40
      resultado += 'Obesidade Grau III (considerada mórbida)';
    }

    return resultado;
  }
}