import 'package:flutter/material.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/widgets/bottom_action_widget.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_description_view_more.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_image_view.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_overview_widget.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({
    required this.id,
    required this.pet,
    super.key,
  });

  final String id;
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin thú cưng')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const .only(left: 16, right: 16, bottom: 12),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 32,
            children: [
              PetDetailImageView(pet: pet),
              PetDetailOverviewWidget(pet: pet),
              PetDetailDescriptionViewMore(
                description: pet.description,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomActionWidget(pet: pet),
      ),
    );
  }
}
