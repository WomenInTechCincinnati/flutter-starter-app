import 'package:flutter_app/app/interactors/wwcode_api_interactor.dart';
import 'package:flutter_app/data/models/member.dart';
import 'package:rxdart/rxdart.dart';

class MemberInteractor {
  final WWCodeApiInteractor wwCodeApiInteractor;

  final BehaviorSubject<List<Member>> _members = BehaviorSubject.seeded(null);

  MemberInteractor(
      this.wwCodeApiInteractor
      );

  void init() {
    refreshAllMembers();
  }

  Future<void> refreshAllMembers() async {
    final result = await wwCodeApiInteractor.getAllMembers();
    if (result.isValue) {
      var list = result.asValue.value;
      list.sort((a, b) => a.name.compareTo(b.name));
      _members.add(list);
    } else {
      return;
    }
  }

  Stream<List<Member>> getAllMembers() => _members;
}