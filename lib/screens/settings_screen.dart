// Importa a biblioteca principal do Flutter para construção da interface
import 'package:flutter/material.dart';

// Importa o componente "MainDrawer" para o menu lateral
import '../components/main_drawer.dart';

// Importa o modelo de dados "Settings" para gerenciar configurações
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  // Recebe as configurações atuais e uma função para notificar alterações
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  // Construtor da classe
  const SettingsScreen(this.settings, this.onSettingsChanged, {super.key});
  // Cria o estado da tela
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Variável para armazenar as configurações
  late Settings settings;

  // Inicializa o estado da tela
  @override
  void initState() {
    super.initState();
    // Obtém as configurações iniciais do widget pai
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          // Atualiza o valor da configuração
          onChanged(value);
          // Notifica a tela pai sobre a alteração
          widget.onSettingsChanged(settings);
        });
  }

  // Constrói a interface da tela de configurações
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      // Menu lateral
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          // Título da seção de configurações
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          // Lista de switches para as configurações
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glútem!',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem Lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Sem Vegana',
                  'Só exibe refeições sem Veganas!',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Sem Vegetariana',
                  'Só exibe refeições sem Vegetarianas!',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
