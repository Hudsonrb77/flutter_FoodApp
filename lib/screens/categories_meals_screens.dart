import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Verificar se ModalRoute.of(context) não é nulo antes de acessar 'settings'
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas de ${category.title}'),
      ),
      body: const Center(
        child: Text('Aqui você verá as receitas por categoria'),
      ),
    );
  }
}
