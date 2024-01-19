import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //`ModalRoute.of(context)`: Classe representando a rota modal atual em Flutter.
    //`.settings`: Acesso às configurações da rota modal para obter informações, como argumentos passados.
    //`.arguments as Category`: Obtém e converte os argumentos da rota para o tipo `Category`, assumindo que são desse tipo.
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${category.id}'),
      ),
    );
  }
}
