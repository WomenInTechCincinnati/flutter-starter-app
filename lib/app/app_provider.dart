import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/clients/wwcode_api_client.dart';
import 'package:flutter_app/app/interactors/app_interactor.dart';
import 'package:flutter_app/app/interactors/member_interactor.dart';
import 'package:flutter_app/app/interactors/wwcode_api_interactor.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:flutter_app/values/variants.dart';

import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Variant variant;
  final Widget child;

  AppProvider({
    @required this.variant,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _AppProvidersFuture(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus.unfocus();
                  }
                },
                child: child,
              ),
              variant: variant,
            );
          } else {
            return Container();
          }
        });
  }

  Future<PackageInfo> initialization() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

}

class _AppProvidersFuture extends StatefulWidget {
final Variant variant;
final Widget child;

_AppProvidersFuture({
  @required this.variant,
  @required this.child,
});

@override
_AppProvidersFutureState createState() =>
    _AppProvidersFutureState(variant);
}

class _AppProvidersFutureState extends State<_AppProvidersFuture> {
  final GlobalKey<NavigatorState> _navigatorKey = new GlobalKey();

  final Variant _variant;

  ThemeData _appTheme;
  WWCodeApiClient _apiClient; 
  WWCodeApiInteractor _apiInteractor; 
  MemberInteractor _memberInteractor;
  AppInteractor _appInteractor;

  _AppProvidersFutureState(this._variant);

  @override
  void initState() {
    super.initState();

    _appTheme = AppTheme.createThemeData();
    _apiClient = WWCodeApiClient(_variant);
    _apiInteractor = WWCodeApiInteractor(_apiClient); 
    _memberInteractor = MemberInteractor(_apiInteractor);
    _appInteractor = AppInteractor();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _navigatorKey),
        Provider.value(value: _variant),
        Provider.value(value: _appTheme),
        Provider.value(value: _apiClient), 
        Provider.value(value: _apiInteractor), 
        Provider.value(value: _memberInteractor),
        Provider.value(value: _appInteractor)
      ],
      child: widget.child,
    );
  }
}