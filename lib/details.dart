import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String nombre;
  final String telefono;
  final String producto;
  final String metodoPago;
  final String lote;
  final String idProducto;

  const Details({
    Key? key,
    required this.nombre,
    required this.telefono,
    required this.producto,
    required this.metodoPago,
    required this.lote,
    required this.idProducto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalles"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              leading: const Icon(Icons.bookmark_added_rounded,
                  color: Colors.blueAccent),
              title: const Text(
                "Información del Producto",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '''
Nombre: $nombre
Teléfono: $telefono
Producto: $producto
Método de pago: $metodoPago
Lote: $lote
ID Producto: $idProducto
                  ''',
                  style: const TextStyle(height: 1.5),
                ),
              ),
              // Icono de borrar añadido aquí
              trailing: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
