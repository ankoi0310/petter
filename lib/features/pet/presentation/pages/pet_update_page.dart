import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/loading_screen.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/pet/presentation/widgets/pet_update_form.dart';

class PetUpdatePage extends StatelessWidget {
  const PetUpdatePage({
    required this.id,
    required this.pet,
    super.key,
  });

  final String id;
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetBloc, PetState>(
      listener: (context, state) {
        state.maybeWhen(
          updatePetSuccess: () {
            context.pop();
            showSnackBar(
              context,
              content: 'Pet updated successfully',
            );
          },
          error: (message) {
            showSnackBar(context, content: message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: const Text('Update pet info'),
              ),
              body: SafeArea(
                child: Stack(
                  children: [PetUpdateForm(id: id, pet: pet)],
                ),
              ),
            ),
            if (state.maybeWhen(
              updating: () => true,
              orElse: () => false,
            ))
              const LoadingScreen(),
          ],
        );
      },
    );
  }
}
