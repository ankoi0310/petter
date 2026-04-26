import 'package:flutter/material.dart';
import 'package:petter/features/pet/presentation/widgets/pet_create_form.dart';

class PetCreatePage extends StatelessWidget {
  const PetCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Create new pet'),
      ),
      body: const SafeArea(child: Stack(children: [PetCreateForm()])),
    );
  }
}
