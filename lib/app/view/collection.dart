import 'package:flutter/material.dart';
import 'package:mi_tarea03_flutter/app/view/splash.dart';

class GaleriaPage extends StatelessWidget {
  // Nombres de las imágenes
  final List<String> imageNames = [
    'acdc',
    'arena',
    'dark',
    'new_y',
    'rock',
    'acdc',
    'arena',
    'dark',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildImageGrid(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Regreso a la ventana principal
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SplashPage(),
            ),
          );
        },
      ),
      title: Text('Galería'),
    );
  }

  Widget buildImageGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imageNames.length,
      itemBuilder: (context, index) {
        return buildImageCard(context, index);
      },
    );
  }

  Widget buildImageCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        // Navegación a la pantalla de detalles con animación Hero
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetallesImagenPage(
              imageName: imageNames[index],
            ),
          ),
        );
      },
      child: Hero(
        tag: 'imageHero${imageNames[index]}',
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'assets/images/${imageNames[index]}.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  imageNames[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetallesImagenPage extends StatelessWidget {
  final String imageName;

  DetallesImagenPage({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $imageName'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Regresar a la pantalla de Galería al tocar el botón de regreso
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero$imageName',
          child: Image.asset(
            'assets/images/$imageName.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
