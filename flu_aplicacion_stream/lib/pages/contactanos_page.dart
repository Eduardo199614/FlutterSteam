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
        title: Text('Contáctanos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: SingleChildScrollView(
              // Agregado para permitir desplazamiento
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formulario de Contacto',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),

                    // Nombre
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: InputBorder.none,
                        ),
                        onSaved: (value) => _nombre = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Teléfono
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Teléfono',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) => _telefono = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su número de teléfono';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Correo
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          border: InputBorder.none,
                        ),
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
                    ),

                    // Mensaje
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.purple, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mensaje',
                          border: InputBorder.none,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Aquí puedes manejar el envío de los datos
                            print('Nombre: $_nombre');
                            print('Teléfono: $_telefono');
                            print('Correo: $_correo');
                            print('Mensaje: $_mensaje');
                          }
                        },
                        child: Text('Enviar mensaje'),
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
}
