import 'package:flutter/material.dart';
import '../seletor_tema.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
//variaveis de teste pegando os dados das TextField
  String nome = "";
  String profissao = "";

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider!.isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Insira seu título inicial!"),
        backgroundColor:
            themeProvider.isDarkTheme ? Colors.blueAccent : Colors.black,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(themeProvider.isDarkTheme
                              ? Icons.light_mode
                              : Icons.dark_mode),
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Nome ",
                      style: TextStyle(
                        color: themeProvider.isDarkTheme
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (text) => {nome = text},
                      decoration: InputDecoration(
                        labelText: 'Digite seu Nome Aqui!',
                        labelStyle: TextStyle(
                          color: themeProvider.isDarkTheme
                              ? Colors.white38
                              : Colors.black45,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Profissão ",
                      style: TextStyle(
                        color: themeProvider.isDarkTheme
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (text) => {profissao = text},
                      decoration: InputDecoration(
                        labelText: 'Digite sua profissão Aqui!',
                        labelStyle: TextStyle(
                          color: themeProvider.isDarkTheme
                              ? Colors.white38
                              : Colors.black45,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (nome.isEmpty || profissao.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Por favor, insira todos os dados!"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Bem-vindo, $nome!")),
                          );
                        }
                      },
                      child: const Text('Pronto!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
