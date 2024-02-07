import 'package:covid/core/components/custom_loading.dart';
import 'package:covid/core/theme/fonts.dart';
import 'package:covid/features/home/presentation/screens/home_screen.dart';
import 'package:covid/features/states/domain/entities/states_current_entity.dart';
import 'package:covid/features/states/domain/entities/states_entity.dart';
import 'package:covid/features/states/presentation/bloc/states_bloc.dart';
import 'package:covid/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/dates_format.dart';
import '../widgets/card_states.dart';
import 'region_detail_screen.dart';

class StatesScreen extends StatefulWidget {
  static const routeName = '/region';

  const StatesScreen({Key? key}) : super(key: key);

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {
  StatesBloc statesBloc = getIt<StatesBloc>();
  bool _isLoading = false;
  List<StatesEntity> listStatesEntity = [];
  List<StatesCurrentEntity> listCurrentStatesEntity = [];

  @override
  void initState() {
    statesBloc.add(GetStatesEvents());
    statesBloc.add(GetStatesCurrentEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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

            // ------// ------// ------// ------// ------// ------// ------
            if (state is LoadingGetStatesCurrentState) {
              setState(() {
                _isLoading = true;
              });
            }

            if (state is FailedGetStatesCurrentState) {
              setState(() {
                _isLoading = false;
              });
            }
            if (state is SuccessGetStatesCurrentState) {
              listCurrentStatesEntity = state.listStatesCurrent;
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
          String cases = '0';
          String lastModified = '';

          final item = listStatesEntity[index];
          StatesCurrentEntity? currenStateEntity =
              listCurrentStatesEntity.firstWhereOrNull(
            (entity) => entity.state == item.state,
          );

          if (currenStateEntity != null) {
            cases =
                NumberFormat('#,##0', 'en_US').format(currenStateEntity.total);

            if (currenStateEntity.dateModified != null) {
              lastModified = DatesFormat.formatDateFormalText(
                  currenStateEntity.dateModified!);
            }
          }

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RegionDetailScreen.routeName,
              arguments: item.state.toLowerCase(),
            ),
            child: CardStates(
              name: item.name,
              cases: cases,
              lastUpdate: lastModified,
              imageUrl:
                  "https://flagcdn.com/w20/us-${item.state.toLowerCase()}.png",
            ),
          );
        },
      );
}
