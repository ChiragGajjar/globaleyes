import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'deep_linking_helper_pamperclub.dart';

class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc2 _bloc = Provider.of<DeepLinkBloc2>(context);
    return StreamBuilder<String>(
      // stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              child: Center(
                  child: Text('No deep link was used  ',
                      style: Theme.of(context).textTheme.subtitle1)));
        } else {
          return Container(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Redirected: ${snapshot.data}',
                          style: Theme.of(context).textTheme.subtitle1))));
        }
      },
    );
  }
}