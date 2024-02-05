import 'package:covid/core/components/custom_input.dart';
import 'package:covid/core/components/custom_loading.dart';
import 'package:covid/core/routes/resource_icons.dart';
import 'package:covid/core/theme/colors.dart';
import 'package:covid/features/auth/domain/entities/login_entity.dart';
import 'package:covid/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_dialog_box.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/components/women_header.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  AuthBloc authBloc = getIt<AuthBloc>();
  final FocusNode _nodeTextField1 = FocusNode();
  final FocusNode _nodeTextField2 = FocusNode();
  final FocusNode _nodeTextField3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: BlocProvider.value(
        value: authBloc,
        child: BlocConsumer<AuthBloc, AuthState>(listener: (ctx, state) async {
          // ------// ------// ------// ------// ------// ------// ------
          if (state is LoadingPostLoginState) {
            setState(() {
              _isLoading = true;
            });
          }

          if (state is FailedPostLoginState) {
            setState(() {
              _isLoading = false;
            });
            _errorMessage(state.error);
          }
          if (state is SuccessPostLoginState) {
            setState(() {
              _isLoading = false;
            });

            if (state.result) {
              await _success();
            } else {
              _errorMessage("El usuario y/o contraseña son incorrectos.");
            }
          }
        }, builder: (context, state) {
          return SafeArea(
            child: _isLoading ? const CustomLoadingPage() : _contentBody(),
          );
        }),
      ),
    );
  }

  Future<void> _success() async {
    //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
  Widget _contentBody() {
    return Stack(
      children: [
        _header(),
        _principalBody(),
      ],
    );
  }

  Widget _header() {
    return const WomenHeader(
      imageHeader: womanImage,
    );
  }

  Widget _principalBody() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        _loginForm(),
      ],
    );
  }

  Widget _loginForm() {
    return Container(
      margin: EdgeInsets.only(top: 42.h),
      padding: EdgeInsets.all(2.w),
      width: double.infinity,
      child: Column(children: [
        _formInformation(authBloc.state),
        SizedBox(
          height: 5.h,
        ),
        _bottomButton(),
        SizedBox(
          height: 1.h,
        ),
        _bottomTextButton(),
        SizedBox(
          height: 1.h,
        ),
        _socialNetwork(),
        SizedBox(
          height: 5.h,
        ),
      ]),
    );
  }

  Widget _formInformation(AuthState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: authBloc.documentTypeStream,
          builder: (_, AsyncSnapshot<String> snapshot) {
            return CustomInput(
              placeholder: "Tipo Documento",
              focusNode: _nodeTextField1,
              keyboardType: TextInputType.text,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              onChanged: (text) {
                authBloc.updateDocumentType(text);
              },
            );
          },
        ),
        SizedBox(height: 2.h),
        StreamBuilder(
          stream: authBloc.documentNumberStream,
          builder: (_, AsyncSnapshot<String> snapshot) {
            return CustomInput(
              placeholder: "Número Documento",
              focusNode: _nodeTextField2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              onChanged: (text) {
                authBloc.updateDocumentNumber(text);
              },
            );
          },
        ),
        SizedBox(height: 2.h),
        StreamBuilder(
          stream: authBloc.passwordStream,
          builder: (_, AsyncSnapshot<String> snapshot) {
            final visibility = state.showPassword;

            final iconVisibility = GestureDetector(
              onTap: () {
                authBloc.add(ShowPasswordEvent(!state.showPassword));
              },
              child: visibility
                  ? const Icon(
                      Icons.visibility_rounded,
                      color: primaryColor,
                    )
                  : const Icon(
                      Icons.visibility_off_rounded,
                      color: secondColor,
                    ),
            );

            return CustomInput(
              placeholder: "Contraseña",
              focusNode: _nodeTextField3,
              keyboardType: TextInputType.text,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12.0),
                child: iconVisibility,
              ),
              obscureText: !visibility,
              onChanged: (text) {
                authBloc.updatePassword(text);
              },
            );
          },
        ),
      ],
    );
  }

  /// Bottom Button for login in netvoz
  StreamBuilder _bottomButton() {
    return StreamBuilder(
      stream: authBloc.validateLoginForm,
      builder: (context, snapshot) {
        return PrimaryButton(
          onPressed: snapshot.hasData
              ? () async {
                  await _setLoginInformation();
                }
              : null,
          height: 6.h,
          child: Text(
            "Login",
            style:
                snapshot.hasData ? textWhiteStyleButton : textBlackStyleButton,
          ),
        );
      },
    );
  }

  Future<void> _setLoginInformation() async {
    Future<String> documentNumberFuture = authBloc.documentNumberStream.first;
    String documentNumber = await documentNumberFuture;

    Future<String> documentTypeFuture = authBloc.documentNumberStream.first;
    String documentType = await documentTypeFuture;

    Future<String> passwordFuture = authBloc.passwordStream.first;
    String password = await passwordFuture;

    authBloc.add(PostLoginEvent(
      documentType: documentType,
      documentNumber: documentNumber,
      password: password,
    ));
  }

  Widget _bottomTextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            _message("Olvidé mi contraseña");
          },
          child: Row(children: [
            Text(
              "Olvidé mi contraseña",
              style: textStyleNormal(mainblack)
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ]),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            Navigator.pushNamed(context, RegisterScreen.routeName);
          },
          child: Row(children: [
            Text(
              "Registrarse",
              style: textStyleNormal(mainblack)
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _socialNetwork() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            _message("Google".toUpperCase());
          },
          icon: Image.asset(googleImage),
        ),
        IconButton(
          onPressed: () {
            _message("Facebook".toUpperCase());
          },
          icon: Image.asset(facebookImage),
        ),
        IconButton(
          onPressed: () {
            _message("Instagram".toUpperCase());
          },
          icon: Image.asset(instagramImage),
        ),
      ],
    );
  }

  Future<void> _errorMessage(String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              icon: SvgPicture.asset(
                warningModalSVG,
                colorFilter:
                    const ColorFilter.mode(secondColor, BlendMode.srcIn),
              ),
              title: 'Lo sentimos',
              descriptions: message,
              confirmText: "Aceptar",
              onAccept: () {
                Navigator.pop(context);
              });
        });
  }

  Future<void> _message(String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              icon: SvgPicture.asset(
                warningModalSVG,
                colorFilter:
                    const ColorFilter.mode(secondColor, BlendMode.srcIn),
              ),
              title: 'Hola',
              descriptions: message,
              confirmText: "Aceptar",
              onAccept: () {
                Navigator.pop(context);
              });
        });
  }
}
