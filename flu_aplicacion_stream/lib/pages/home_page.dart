import 'package:flutter/material.dart';
import 'nosotros_page.dart';
import 'contactanos_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Lista de páginas para la navegación
  final List<Widget> _pages = [
    HomeContent(),
    NosotrosPage(),
    ContactanosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _pages[_currentIndex], // Muestra la página actual
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Nosotros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contáctanos',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambia la página al tocar un ítem
          });
        },
      ),
    );
  }
}

// Contenido de la página de inicio
class HomeContent extends StatelessWidget {
  final List<Movie> movies = [
    Movie(title: 'Pelicula 1', imageUrl: 'assets/imagen/pelicula1.jpeg'),
    Movie(title: 'Pelicula 2', imageUrl: 'assets/imagen/pelicula2.jpeg'),
    Movie(title: 'Pelicula 3', imageUrl: 'assets/imagen/pelicula3.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 1', imageUrl: 'assets/imagen/pelicula1.jpeg'),
    Movie(title: 'Pelicula 2', imageUrl: 'assets/imagen/pelicula2.jpeg'),
    Movie(title: 'Pelicula 3', imageUrl: 'assets/imagen/pelicula3.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 1', imageUrl: 'assets/imagen/pelicula1.jpeg'),
    Movie(title: 'Pelicula 2', imageUrl: 'assets/imagen/pelicula2.jpeg'),
    Movie(title: 'Pelicula 3', imageUrl: 'assets/imagen/pelicula3.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 1', imageUrl: 'assets/imagen/pelicula1.jpeg'),
    Movie(title: 'Pelicula 2', imageUrl: 'assets/imagen/pelicula2.jpeg'),
    Movie(title: 'Pelicula 3', imageUrl: 'assets/imagen/pelicula3.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
    Movie(title: 'Pelicula 4', imageUrl: 'assets/imagen/pelicula4.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Añadimos padding para el GridView
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 5 columnas
          crossAxisSpacing: 8.0, // Espacio horizontal entre columnas
          mainAxisSpacing: 8.0, // Espacio vertical entre filas
          childAspectRatio:
              0.7, // Relación de aspecto de cada ítem (ancho/alto)
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                movies[index].imageUrl,
                fit: BoxFit.cover,
                width: 100, // Ajuste del ancho
                height: 120, // Ajuste de la altura
              ),
              SizedBox(height: 8), // Espacio entre la imagen y el texto
              Text(
                movies[index].title,
                style: TextStyle(fontSize: 12), // Ajuste del tamaño del texto
                textAlign: TextAlign.center, // Centrado del texto
              ),
            ],
          );
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            movie.imageUrl,
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
