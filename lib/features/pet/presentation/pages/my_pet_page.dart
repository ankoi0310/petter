import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/pet/presentation/widgets/my_pet_grid_view.dart';

class MyPetPage extends StatelessWidget {
  const MyPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thú cưng của tôi'),
        actionsPadding: const .only(right: 16),
        actions: [
          AppIconButton(
            onTap: () => context.pushNamed(AppRoutes.myPetAdd.name),
            icon: Iconsax.add_copy,
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<PetBloc, PetState>(
          listener: (context, state) {
            state.whenOrNull(
              deletePetSuccess: () {
                showSnackBar(
                  context,
                  content: 'Đã xoá thú cưng thành công',
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (homePets, searchPets, userPets, _) {
                if (userPets.isEmpty) {
                  return const Center(
                    child: Text('Bạn chưa đăng tải thú cưng nào'),
                  );
                }

                return MyPetGridView(pets: userPets);
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
