import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
        backgroundColor: Colors.blue,
      ),
      body: GridView(
        //Uma area que tem rolagem. Delegando a forma de rendereizar a sua grid para o MaxCrossAligmentExtent.
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //Cada elemento vai ter uma extensão de no máximo 200 pixels.
          maxCrossAxisExtent: 200,
          //Qual vai ser a proporsão de cada elemento no meu grid view.
          // Se ele vai ser mais largo do que alto, ou mais alto do que largo...
          childAspectRatio: 3 / 2,
          //Espacamento no eixo cruzado de 20
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
