// Importa as bibliotecas necessárias para o funcionamento do aplicativo
import 'package:flutter/material.dart';

//Importa a as abas
import 'screens/tabs_screen.dart';

//Importa as telas
import 'package:meals/screens/categories_meals_screens.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';

// Importa as rotas do aplicativo, os modelos de dados
import 'utils/app_routes.dart';
import 'models/meal.dart';
import 'models/settings.dart';

// Importa os dados fictícios
import 'data/dummy_data.dart';

void main() {
  // Executa o aplicativo, iniciando a tela inicial
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define as variáveis:
  // - Configurações do aplicativo
  Settings settings = Settings();
  // - Lista de refeições disponíveis
  List<Meal> _availableMeals = dummyMeals;
  // - Lista de refeições favoritas
  final List<Meal> _favoriteMeals = [];

  // Função para filtrar refeições com base nas configurações do usuário
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      // Verifica se cada filtro está ativo e se a refeição não o atende
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        // Retorna apenas as refeições que atendem a todos os filtros
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  // Função para alternar uma refeição entre favorita e não favorita
  void _toggleFavorite(Meal meal) {
    setState(() {
      // Se a refeição já estiver na lista de favoritas, remove-a
      // Se não, adiciona-a à lista
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  // Função para verificar se uma refeição está na lista de favoritas
  bool _isFavorite(Meal meal) {
    // Retorna `true` se a refeição estiver na lista, `false` caso contrário
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        hintColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // Rotas do aplicativo:
      // - Rota para a tela inicial
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        // - Rota para a tela de categorias
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        // - Rota para a tela de detalhes de uma refeição
        AppRoutes.mealDetail: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        // - Rota para a drawer de configurações.
        AppRoutes.settings: (ctnx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
} //Teste

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
      ),
      body: const Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
