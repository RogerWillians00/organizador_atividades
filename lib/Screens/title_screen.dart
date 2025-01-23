import 'package:flutter/material.dart';
import '../seletor_tema.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void onStartPressed(BuildContext context) {
    // Navegação para a página de login
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider!.isDarkTheme ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Titulo do App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Arial Rounded MT Bold',
                    fontWeight: FontWeight.bold,
                    color:
                        themeProvider.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10), // Espaçamento entre os textos
                Text(
                  'Subtitulo do app',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.normal,
                    color: themeProvider.isDarkTheme
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(
                themeProvider.isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => onStartPressed(context),
                style: ElevatedButton.styleFrom(
                  primary: themeProvider.isDarkTheme
                      ? Colors.grey[800]
                      : Colors.blue, // Cor do botão
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Começar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
