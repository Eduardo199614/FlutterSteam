import 'package:flutter/material.dart';

class ContactanosPage extends StatefulWidget {
  @override
  _ContactanosPageState createState() => _ContactanosPageState();
}

class _ContactanosPageState extends State<ContactanosPage> {
  final _formKey = GlobalKey<FormState>();

  String? _nombre;
  String? _telefono;
  String? _correo;
  String? _mensaje;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Contáctanos', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor:
            const Color.fromARGB(255, 90, 182, 228), // Color formal y elegante
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueGrey.shade300, width: 2),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formulario de Contacto',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900]),
                    ),
                    SizedBox(height: 16),

                    // Nombre
                    _buildInputField(
                      labelText: 'Nombre',
                      onSaved: (value) => _nombre = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                    ),

                    // Teléfono
                    _buildInputField(
                      labelText: 'Teléfono',
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _telefono = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su número de teléfono';
                        }
                        return null;
                      },
                    ),

                    // Correo
                    _buildInputField(
                      labelText: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => _correo = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Por favor ingrese un correo válido';
                        }
                        return null;
                      },
                    ),

                    // Mensaje
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.blueGrey.shade300, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mensaje',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 46, 61, 68),
                              fontWeight: FontWeight.w500),
                        ),
                        maxLines: 4,
                        onSaved: (value) => _mensaje = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su mensaje';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Botón de enviar
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 96, 197, 247), // Color formal
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Manejo de datos
                            print('Nombre: $_nombre');
                            print('Teléfono: $_telefono');
                            print('Correo: $_correo');
                            print('Mensaje: $_mensaje');
                          }
                        },
                        child: Text('Enviar mensaje',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método para crear campos de entrada de datos
  Widget _buildInputField({
    required String labelText,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueGrey.shade300, width: 1),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          labelStyle: TextStyle(
              color: Colors.blueGrey[800], fontWeight: FontWeight.w500),
        ),
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
