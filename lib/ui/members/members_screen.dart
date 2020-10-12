import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/member.dart';
import 'package:flutter_app/ui/members/members_viewmodel.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:provider/provider.dart';

class MembersScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MembersScreen();
  }

}

class _MembersScreen extends State<MembersScreen> {

  MembersViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = MembersViewModel.fromContext(context);
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => _viewModel,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: StreamBuilder<List<Member>>(
                stream: _viewModel.getMembers(),
                builder: (final BuildContext context,
                    final AsyncSnapshot<List<Member>> snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                      color: primaryColorLight,
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data.isNotEmpty) {
                      List<Member> members = snapshot.data; 
                      return ListView.builder(
                          itemCount: members.length,
                          itemBuilder: (context, i) {
                            return Column(children: [
                              Text(members[i].name)
                            ]);
                          });
                    } else {
                      return Container(
                        color: primaryColorLight,
                      );
                    }
                  } else {
                    return Container(
                      color: primaryColorLight,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}