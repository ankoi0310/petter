import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/home/presentation/widgets/species_card.dart';
import 'package:petter/features/species/presentation/bloc/species_bloc.dart';

class SpeciesHorizontalListView extends StatefulWidget {
  const SpeciesHorizontalListView({super.key});

  @override
  State<SpeciesHorizontalListView> createState() =>
      _SpeciesHorizontalListViewState();
}

class _SpeciesHorizontalListViewState
    extends State<SpeciesHorizontalListView> {
  @override
  void initState() {
    super.initState();

    context.read<SpeciesBloc>().add(const SpeciesEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SpeciesBloc>().state;
    return state.maybeWhen(
      loaded: (species) {
        return Row(
          mainAxisAlignment: .spaceBetween,
          children: List.generate(4, (index) {
            return Flexible(
              child: SpeciesCard(species: species[index]),
            );
          }),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
