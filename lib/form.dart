import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _proveedorController = TextEditingController();
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _productoController = TextEditingController();
  final _metodoPagoController = TextEditingController();
  final _loteController = TextEditingController();
  final _idProductoController = TextEditingController();

  @override
  void dispose() {
    _proveedorController.dispose();
    _nombreController.dispose();
    _telefonoController.dispose();
    _productoController.dispose();
    _metodoPagoController.dispose();
    _loteController.dispose();
    _idProductoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Formulario de Producto"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _proveedorController,
              fieldName: "Proveedor",
              myIcon: Icons.business,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre",
              myIcon: Icons.person,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _telefonoController,
              fieldName: "Teléfono",
              myIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _productoController,
              fieldName: "Producto",
              myIcon: Icons.shopping_bag,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _metodoPagoController,
              fieldName: "Método de pago",
              myIcon: Icons.payment,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _loteController,
              fieldName: "Lote",
              myIcon: Icons.inventory,
            ),
            const SizedBox(height: 10),
            MyTextField(
              myController: _idProductoController,
              fieldName: "ID Producto",
              myIcon: Icons.qr_code,
            ),
            const SizedBox(height: 20),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              proveedor: _proveedorController.text,
              nombre: _nombreController.text,
              telefono: _telefonoController.text,
              producto: _productoController.text,
              metodoPago: _metodoPagoController.text,
              lote: _loteController.text,
              idProducto: _idProductoController.text,
            );
          }),
        );
      },
      child: Text(
        "Enviar Formulario".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
