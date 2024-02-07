import 'package:covid/core/components/custom_loading.dart';
import 'package:covid/features/states/domain/entities/region_detail_entity.dart';
import 'package:covid/features/states/presentation/bloc/states_bloc.dart';
import 'package:covid/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/primary_button.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/alert_dialogs.dart';
import '../../../../core/utils/launch_url_utils.dart';
import '../../../../core/utils/launch_urls.dart';
import '../widgets/custom_header.dart';
import '../widgets/header_info_event.dart';

class RegionDetailScreen extends StatefulWidget {
  static const routeName = '/region-detail';

  final String regionState;

  const RegionDetailScreen({Key? key, required this.regionState})
      : super(key: key);

  @override
  State<RegionDetailScreen> createState() => _RegionDetailScreenState();
}

class _RegionDetailScreenState extends State<RegionDetailScreen> {
  StatesBloc statesBloc = getIt<StatesBloc>();
  bool _isLoading = false;
  RegionDetailEntity regionDetailEntity = const RegionDetailEntity.empty();

  @override
  void initState() {
    statesBloc.add(GetRegionDetailEvents(regionState: widget.regionState));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: statesBloc,
        child: BlocConsumer<StatesBloc, StatesState>(
          listener: (context, state) {
            // ------// ------// ------// ------// ------// ------// ------
            if (state is LoadingGetRegionDetailState) {
              setState(() {
                _isLoading = true;
              });
            }

            if (state is FailedGetRegionDetailState) {
              setState(() {
                _isLoading = false;
              });
            }
            if (state is SuccessGetRegionDetailState) {
              regionDetailEntity = state.entity;
              setState(() {
                _isLoading = false;
              });
            }
          },
          builder: (context, state) {
            return SafeArea(
                child: _isLoading ? const CustomLoadingPage() : contentBody());
          },
        ),
      ),
    );
  }

  Widget contentBody() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      child: Stack(
        children: [
          _header(),
          _principalBody(),
        ],
      ),
    );
  }

  Widget _header() {
    return CustomHeader(
      imageHeader: "https://flagcdn.com/w640/us-${widget.regionState}.png",
      back: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _principalBody() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      padding: EdgeInsets.all(5.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: colorWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header Info Data for detail Screen
          _typesHeaderInfo(),

          _description(),
        ],
      ),
    );
  }

  Widget _typesHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HeaderInfoEvent(
          color: secondColor,
          keyName: regionDetailEntity.pui ?? '',
          value:
              regionDetailEntity.covidTrackingProjectPreferredTotalTestUnits ??
                  '',
        ),
        HeaderInfoEvent(
          color: secondColor,
          keyName:
              regionDetailEntity.covidTrackingProjectPreferredTotalTestField ??
                  '',
          value: regionDetailEntity.totalTestResultsField ?? '',
        ),
      ],
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            regionDetailEntity.name ?? '',
            style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            regionDetailEntity.notes ?? '',
            style: GoogleFonts.lato(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  Widget _showSiteButton() {
    return PrimaryButton(
      onPressed: _showSite,
      child: Text(
        'Ir a enlace',
        style: textWhiteStyleButton,
      ),
    );
  }

  // * ----------------------
  // * Button Functionalities
  // * ----------------------

  Future<void> _showSite() async {
    try {
      await LaunchLinks.launchLink(
        commingUrl: Uri.parse(
          addProtocolToUrl(regionDetailEntity.covid19SiteSecondary!),
        ),
      );
    } catch (_) {
      // ignore: use_build_context_synchronously
      showErrorDialog(
        message: 'La vista web se cerró inesperadamente',
        context: context,
      );
    }
  }
}
