import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/loading_screen.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/pet/presentation/widgets/pet_create_form.dart';
import 'package:petter/features/species/presentation/bloc/species_bloc.dart';

class PetCreatePage extends StatelessWidget {
  const PetCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetBloc, PetState>(
      listener: (context, state) {
        state.maybeWhen(
          createPetSuccess: () {
            context.pop();
            showSnackBar(
              context,
              content: 'Thêm thú cưng thành công',
            );
          },
          error: (message) {
            showSnackBar(context, content: message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final species =
            context.read<SpeciesBloc>().state.whenOrNull(
              loaded: (species) => species,
            ) ??
            [];
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: const Text('Thêm thú cưng'),
              ),
              body: SafeArea(child: PetCreateForm(species: species)),
            ),
            if (state.maybeWhen(
              creating: () => true,
              orElse: () => false,
            ))
              const LoadingScreen(),
          ],
        );
      },
    );
  }
}
