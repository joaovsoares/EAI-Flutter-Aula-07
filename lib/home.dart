import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculadoraimc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>(); //chave única no app inteiro
  TextEditingController _pesoEdit = TextEditingController();
  TextEditingController _alturaEdit = TextEditingController();
  String _resultado;

  void limparCampos() {
    _pesoEdit.text = '';
    _alturaEdit.text = '';

    setState(() {
      _resultado = 'Informe peso e altura';
    });
  }

  @override
  void initState() {
    super.initState();
    limparCampos();
  }

  void calcularIMC() {
    double peso = double.parse(_pesoEdit.text);
    double altura = double.parse(_alturaEdit.text) / 100.0;
    var calculadoraIMC = new CalculadoraIMC(altura, peso);

    setState(() {
      _resultado = calculadoraIMC.classificar();
    });
  }

  FloatingActionButton botaoDeCalculo() {
    return FloatingActionButton(
        onPressed: () { 
          if (_chaveFormulario.currentState.validate()) {
            calcularIMC();
          }
        },
        tooltip: 'Calcular',
        child: Icon(Icons.calculate)
    );
  }

  IconButton botaoDeLimpar() {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        limparCampos();
      }
    );
  }

  AppBar appBar(String titulo) {
    return AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          botaoDeLimpar(),
        ],
      );
  }

  TextFormField campoTexto({TextEditingController controller, String mensagemDeErro, String rotulo}) {
    return TextFormField(

      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(labelText: rotulo),
      controller: controller,
      validator: (text) {
        return text.isEmpty ? mensagemDeErro : null;
      },
    );
  }

  Padding textoResultado() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _resultado,
        textAlign: TextAlign.center,
      ),
    );
  }

  Form formulario() {
    return Form(
      key: _chaveFormulario,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          campoTexto(
            rotulo: 'Peso (kg)',
            mensagemDeErro: 'Informe o peso!',
            controller: _pesoEdit
          ),
          campoTexto(
            rotulo: 'Altura (cm)',
            mensagemDeErro: 'Informe a altura!',
            controller: _alturaEdit
          ),
          textoResultado(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0), 
        child: formulario()
      ),
      floatingActionButton: botaoDeCalculo(),
    );
  }
}