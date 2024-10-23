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
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return HoverMovieCard(movie: movies[index]);
        },
      ),
    );
  }
}

// Modelo de la película
class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});
}

// Widget con efecto de hover
class HoverMovieCard extends StatefulWidget {
  final Movie movie;

  const HoverMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  _HoverMovieCardState createState() => _HoverMovieCardState();
}

class _HoverMovieCardState extends State<HoverMovieCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.1)) // Transformación correcta
            : Matrix4.identity(),
        child: Column(
          children: [
            Image.asset(
              widget.movie.imageUrl,
              fit: BoxFit.cover,
              width: 100,
              height: 120,
            ),
            SizedBox(height: 8),
            Text(
              widget.movie.title,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
