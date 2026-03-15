import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/presentation/cubit/reciters/reciters_cubit.dart';

import '../../../Common/custom_toggle.dart';
import 'audio_card.dart';
import 'cubit/radio/radio_cubit.dart';
import 'cubit/radio/radio_state.dart';
import 'cubit/reciters/reciters_state.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlidingToggle(
          onToggle: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [_buildRadio(), _buildReciters()],
          ),
        ),
      ],
    );
  }

  Widget _buildRadio() {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RadioErrorState) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is RadioSuccessState) {
          final radios = state.radios;

          return ListView.builder(
            itemCount: radios.length,
            itemBuilder: (context, index) {
              final radio = radios[index];

              return AudioCard(
                title: radio.name ?? "",
                isPlaying: context.read<RadioCubit>().playingIndex == index,
                onPlayTap: () {
                  context.read<RadioCubit>().playRadio(radio.url ?? "", index);
                },
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildReciters() {
    return BlocBuilder<ReciterCubit, ReciterState>(
      builder: (context, state) {
        final cubit = context.read<ReciterCubit>();
        final reciters = cubit.reciters;

        if (state is ReciterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ReciterErrorState) {
          return Center(child: Text(state.errorMessage));
        }

        return ListView.builder(
          itemCount: reciters.length,
          itemBuilder: (context, index) {
            final reciter = reciters[index];
            final moshaf = reciter.moshaf?.first;

            return AudioCard(
              title: reciter.name ?? "Unknown",
              subtitle: moshaf?.name,
              isPlaying: context.read<ReciterCubit>().playingIndex == index,
              onPlayTap: () {
                if (moshaf != null) {
                  context.read<ReciterCubit>().playReciter(reciter, index);
                }
              },
            );
          },
        );
      },
    );
  }
}
