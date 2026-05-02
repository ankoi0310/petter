import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/adoption/presentation/widgets/request_card.dart';

class MyRequestListView extends StatefulWidget {
  const MyRequestListView({super.key});

  @override
  State<MyRequestListView> createState() => _MyRequestListViewState();
}

class _MyRequestListViewState extends State<MyRequestListView> {
  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(
      const AdoptionEvent.getMyAdoptionRequests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdoptionBloc, AdoptionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (_, myRequests) {
            if (myRequests.isEmpty) {
              return const Center(
                child: Text("You don't have any adoption request"),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              padding: const .symmetric(horizontal: 16, vertical: 12),
              itemCount: myRequests.length,
              itemBuilder: (context, index) {
                final request = myRequests[index];
                return RequestCard(request: request);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
