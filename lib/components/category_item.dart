import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) => CategoriesMealsScreen(category),
    //   ),
    // );

    Navigator.of(context).pushNamed('/categories-meals', arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //Para o texto não ficar muito colado com a parte de cima.
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          //Arredondando a borda de cada um dos pontos.
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              //Vamos usar a cor e a variação da cor aplicando uma opacidade.
              //A opacidade da cor terminando com a cor
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              //Onde irá começar(begin) e terminar(end) o gradiente.
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(category.title),
      ),
    );
  }
}
