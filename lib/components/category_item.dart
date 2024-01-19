import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

// Função para navegar para a tela de refeições de categorias
  void _selectCategory(BuildContext context) {
    // Inicia uma nova transição de tela usando o Navigator
    //O Navigator trabalha com uma pilha(LITERALMENTE) de telas.
    //Suponha que esteja na Tela Home. Ao clicar em uma categoria. Empilhada sobre a Tela home.
    //Exemplo: Tela Categoria, Tela home.
    // DEPOIS: Tela 3, Tela Categoria e Tela home.
    // Ao voltar(geralmente usando o botão de voltar) a tela no topo da pilha é removida:
    // Ficando assim, Tela Categoria e Tela home.
    //EM RESUMO, a linha abaixo vai empurrar uma tela em cima da pilha.
    //Navigator.of(context).push

    Navigator.of(context).pushNamed(
      '/categories-meals',
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Com o INkWell eu consigo ter um feedback que o usuario clicou.
    return InkWell(
      onTap: () => _selectCategory(context),
      //O clique vai ter a cor associada a cor categoria.
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // Manter o clique dentro da area.
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
