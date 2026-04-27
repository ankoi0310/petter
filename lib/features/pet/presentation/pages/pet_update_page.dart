import 'package:flutter/material.dart';
import 'package:petter/features/pet/presentation/widgets/pet_update_form.dart';

class PetUpdatePage extends StatelessWidget {
  const PetUpdatePage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Update pet info'),
      ),
      body: const SafeArea(child: Stack(children: [PetUpdateForm()])),
    );
  }
}
