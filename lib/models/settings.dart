class Settings {
  // Define variáveis booleanas para cada restrição dietética
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  // Construtor opcional para inicializar os valores das configurações
  Settings({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
