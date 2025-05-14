import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Informasi'),
          content: Text('Halo, $name! Email Anda adalah $email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.of(context).pushNamed('/thankyou', arguments: name); // Navigasi
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildFormLayout(BoxConstraints constraints) {
    bool isWide = constraints.maxWidth > 600;

    return Form(
      key: _formKey,
      child: isWide
          ? Row(
              children: [
                Expanded(child: _buildNameField()),
                const SizedBox(width: 16),
                Expanded(child: _buildEmailField()),
              ],
            )
          : Column(
              children: [
                _buildNameField(),
                const SizedBox(height: 12),
                _buildEmailField(),
              ],
            ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: _inputDecoration('Nama'),
      validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: _inputDecoration('Email'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
        if (!value.contains('@') || !value.contains('.')) return 'Format email tidak valid';
        return null;
      },
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 222, 233), // soft background
      appBar: AppBar(title: const Text('Flutter Praktikum')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              _buildFormLayout(constraints),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: _handleSubmit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
