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
                      return Container(
                          color: primaryColorLight,
                          child: ListView.builder(
                              itemCount: members.length,
                              itemBuilder: (context, i) {
                                return _buildMemberCard(members[i]);
                              }));
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

  Widget _buildMemberCard(Member member) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // TODO IMAGE
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0, 16.0, 0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: primaryColorTeal, shape: BoxShape.circle),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.name,
                            style: TextStyle(
                                fontSize: 20.0, color: primaryTextColor),
                          ),
                          Container(
                            height: 3.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: secondaryColorGrey,
                                size: 18.0,
                              ),
                              // TODO LOCATION
                              Text("Location")
                            ],
                          )
                        ])
                  ],
                ),
                // TODO HOBBIES
                Row(),
                // TODO TECHS
                Row(),
                // TODO LINKS
                Row()
              ],
            )));
  }
}