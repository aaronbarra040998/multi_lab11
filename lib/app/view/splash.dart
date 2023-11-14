import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mi_tarea03_flutter/app/view/collection.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Color de la línea blanca
            height: 22, // Altura de la línea blanca
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/cover.json',
                width: 600,
                height: 300,
                repeat: true,
              ),
              SizedBox(height: 20),
              Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontFamily: 'CascadiaCode',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Redirección a la página Galería
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => GaleriaPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'push to play',
                  style: TextStyle(
                    fontFamily: 'CascadiaCode',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
