import 'package:flutter_app/app/interactors/wwcode_api_interactor.dart';
import 'package:flutter_app/data/models/quote.dart';
import 'package:rxdart/rxdart.dart';

class QuoteInteractor {
  final WWCodeApiInteractor wwCodeApiInteractor;

  final BehaviorSubject<List<Quote>> _quotes = BehaviorSubject.seeded(null);

  QuoteInteractor(this.wwCodeApiInteractor);

  void init() {
    refreshAllQuotes();
  }

  Future<void> refreshAllQuotes() async {
    final result = await wwCodeApiInteractor.getAllQuotes();
    if (result.isValue) {
      var list = result.asValue.value;
      list.sort((a, b) => a.author.compareTo(b.author));
      _quotes.add(list);
    } else {
      return;
    }
  }

  Stream<List<Quote>> getAllQuotes() => _quotes;
}
