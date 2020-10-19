import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/interactors/member_interactor.dart';
import 'package:flutter_app/data/models/member.dart';
import 'package:provider/provider.dart';

class MembersViewModel {

  static MembersViewModel of(BuildContext context) {
    return Provider.of(context, listen: false);
  }

  factory MembersViewModel.fromContext(BuildContext context) {
    return MembersViewModel(
      Provider.of(context, listen: false),
    );
  }

  final MemberInteractor _memberInteractor;

  MembersViewModel(this._memberInteractor);

  init() {
    _memberInteractor.init();
  }

  Stream<List<Member>> getMembers() => _memberInteractor.getAllMembers();
}