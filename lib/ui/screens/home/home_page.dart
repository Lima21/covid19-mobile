import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/base_bloc.dart';
import '../../app.dart';

/// Creates an HomePage extending [BasePage]
/// that is a StatefulWidget
class HomePage extends BasePage {

  /// Home page view
  HomePage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget get builder =>
      MultiProvider(
          providers: [
            ChangeNotifierProvider<StatsProvider>.value(value: StatsProvider())
          ],
          child: HomePage(title: title)
      );

}

class _HomePageState extends BaseState<HomePage, AppBloc> {


  @override
  Widget build(BuildContext context) {

    var stats = Provider.of<StatsProvider>(context);
    logger.i('[StatsProvider] $stats!');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Covid App"),
          ),
          Text("Confirmados: ${stats.confirmed}"),
        ],
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    bloc.getStats();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if(result is StatsResultStream) {

      Provider
          .of<StatsProvider>(context, listen: false)
          .setStats(result.model);
    }
  }
}
