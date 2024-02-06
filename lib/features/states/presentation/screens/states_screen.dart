import 'dart:ffi';

import 'package:covid/core/components/custom_loading.dart';
import 'package:covid/core/theme/colors.dart';
import 'package:covid/core/theme/fonts.dart';
import 'package:covid/features/home/presentation/screens/home_screen.dart';
import 'package:covid/features/states/domain/entities/states_entity.dart';
import 'package:covid/features/states/presentation/bloc/states_bloc.dart';
import 'package:covid/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/card_states.dart';

class StatesScreen extends StatefulWidget {
  static const routeName = '/region-detail';

  const StatesScreen({Key? key}) : super(key: key);

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {
  StatesBloc statesBloc = getIt<StatesBloc>();
  bool _isLoading = false;
  List<StatesEntity> listStatesEntity = [];

  @override
  void initState() {
    statesBloc.add(GetStatesEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: Text(
          "Detalles por región",
          style: textBlackStyleSubTitle.copyWith(
              color: Theme.of(context).colorScheme.primary),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: statesBloc,
        child: BlocConsumer<StatesBloc, StatesState>(
          listener: (context, state) {
            // ------// ------// ------// ------// ------// ------// ------
            if (state is LoadingGetStatesState) {
              setState(() {
                _isLoading = true;
              });
            }

            if (state is FailedGetStatesState) {
              setState(() {
                _isLoading = false;
              });
            }
            if (state is SuccessGetStatesState) {
              listStatesEntity = state.listStates;
              setState(() {
                _isLoading = false;
              });
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                _principalBody(),
                Visibility(
                  visible: _isLoading,
                  child: const CustomLoadingPage(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _principalBody() => ListView.builder(
        itemCount: listStatesEntity.length,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = listStatesEntity[index];
          return CardStates(
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            name: item.name,
            cases: "2",
            lastUpdate: '21 Ene 2021',
          );
        },
      );
}
