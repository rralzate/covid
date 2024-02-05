import 'package:covid/features/home/domain/entities/device_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/custom_loading.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/dates_format.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import 'card_covid_measures.dart';

class CardCovidInformation extends StatefulWidget {
  const CardCovidInformation({super.key});

  @override
  State<CardCovidInformation> createState() => _CardCovidInformationState();
}

class _CardCovidInformationState extends State<CardCovidInformation> {
  HomeBloc homeBloc = getIt<HomeBloc>();
  bool _isLoading = false;
  DeviceEntity deviceEntity = DeviceEntity.empty();

  @override
  void initState() {
    homeBloc.add(GetCovidInformationEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // ------// ------// ------// ------// ------// ------// ------
          if (state is LoadingGetCovidInformationState) {
            setState(() {
              _isLoading = true;
            });
          }

          if (state is FailedGetCovidInformationState) {
            setState(() {
              _isLoading = false;
            });
          }
          if (state is SuccessGetCovidInformationState) {
            deviceEntity = state.deviceEntity;
            setState(() {
              _isLoading = false;
            });
          }
        },
        builder: (context, state) {
          return _isLoading ? const CustomLoadingPage() : _contentBody();
        },
      ),
    );
  }

  Container _contentBody() {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(top: 45.h),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: mainWhite,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                "Fecha Recoleccion de datos: ",
                style: textBlackStyleThinPositionCovidcard,
              )),
              Expanded(
                  child: Text(
                (deviceEntity.date == 0
                    ? ''
                    : DatesFormat.convertIntToDateTime(deviceEntity.date)),
                style: textBlackStyleThinPositionCovidcard,
              )),
            ],
          ),
          _verticalSeparator(),
          Container(
            margin: EdgeInsets.only(right: 3.w, left: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.totalTestResults),
                      title: "Casos totales",
                    ),
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.positive),
                      title: "Casos confirmados",
                    ),
                  ],
                ),
                _verticalSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.negativeIncrease),
                      title: "Pruebas negativas",
                    ),
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.positiveIncrease),
                      title: "Pruebas positivas",
                    ),
                  ],
                ),
                _verticalSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.death),
                      title: "Fallecidos",
                    ),
                    CardCovidMeaures(
                      measure: NumberFormat('#,##0', 'en_US')
                          .format(deviceEntity.recovered ?? 0),
                      title: "Recuperados",
                    ),
                  ],
                ),
                _verticalSeparator(),
                CardCovidMeaures(
                  measure:
                      NumberFormat('#,##0', 'en_US').format(deviceEntity.death),
                  title: "Pruebas pendientes",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021",
            style: textBlackStyle,
          )
        ],
      ),
    );
  }

  SizedBox _verticalSeparator() {
    return SizedBox(
      height: 1.h,
    );
  }
}
