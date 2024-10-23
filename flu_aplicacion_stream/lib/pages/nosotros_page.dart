import 'package:flutter/material.dart';

class NosotrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nosotros', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor:
            const Color.fromARGB(255, 103, 184, 224), // Color formal y elegante
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Sobre Video Streaming',
              content:
                  'En Video Streaming, nos dedicamos a ofrecer la mejor experiencia de transmisión de contenido en línea. '
                  'Nuestro objetivo es brindar acceso a una amplia variedad de videos y contenido multimedia de alta calidad, '
                  'disponible en cualquier momento y desde cualquier lugar.',
              backgroundColor: Colors.blueGrey[50],
              borderColor: Colors.blueGrey[700],
            ),
            _buildSection(
              title: 'Nuestra Misión',
              content:
                  'Nos esforzamos por liderar la innovación en el sector de la transmisión digital, '
                  'proporcionando una plataforma intuitiva, confiable y accesible para que todos puedan disfrutar '
                  'de sus videos favoritos sin interrupciones.',
              backgroundColor: Colors.grey[50],
              borderColor: Colors.blueGrey[700],
            ),
            _buildSection(
              title: 'Nuestra Visión',
              content:
                  'Ser el servicio de transmisión preferido a nivel mundial, con una oferta diversa de contenido y una experiencia de usuario de primer nivel.',
              backgroundColor: Colors.grey[50],
              borderColor: Colors.blueGrey[700],
            ),
            _buildSection(
              title: 'Nuestros Valores',
              content: '1. Calidad y excelencia en el servicio.\n'
                  '2. Innovación constante.\n'
                  '3. Accesibilidad y facilidad de uso.\n'
                  '4. Enfoque en el cliente.',
              backgroundColor: Colors.grey[50],
              borderColor: Colors.blueGrey[700],
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir cada sección
  Widget _buildSection({
    required String title,
    required String content,
    required Color? backgroundColor,
    required Color? borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor!, width: 2),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900]),
          ),
          SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
          ),
        ],
      ),
    );
  }
}
