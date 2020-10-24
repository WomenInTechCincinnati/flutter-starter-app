import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/member.dart';
import 'package:flutter_app/ui/members/members_viewmodel.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:flutter_app/values/strings.dart';
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
                    // TODO DISPLAY ERROR SCREEN
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
                      // TODO DISPLAY EMPTY STATE SCREEN
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
        color: accentColorWhite,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: primaryColorTeal,
                          child: ColorFiltered(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(member.imageUrl),
                            ),
                            colorFilter: greyScaleColorFilter,
                          ),
                        )),
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
                              Text(member.location,
                                style: TextStyle(
                                    color: primaryTextColor
                                ),
                              )
                            ],
                          )
                        ])
                  ],
                ),
                // TODO HOBBIES
                _buildHobbyList(member),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                ),
                // TODO TECHS
                _buildTechList(member),
                // TODO LINKS
                Row()
              ],
            )));
  }

  Widget _buildHobbyList(Member member) {
    return Wrap(
      spacing: 5.0,
      children: [
        Text(Strings.hobbies, style: TextStyle(color: primaryTextColor),),
        for (var hobby in member.hobbyList)
          Text(hobby, style: TextStyle(color: primaryTextColor),),
      ],
    );
  }


  Widget _buildTechList(Member member) {
    return Wrap(
      spacing: 5.0,
      children: [
        Text(Strings.techs, style: TextStyle(color: primaryTextColor),),
        for (var tech in member.favoriteTechs)
          Text(tech, style: TextStyle(color: primaryTextColor),),
      ],
    );
  }
}