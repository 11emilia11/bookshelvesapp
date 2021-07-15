import 'package:bookshelvesapp/feed/feed_repository.dart';
import 'package:bookshelvesapp/feed/feed_state.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class FeedController {
  final stateNotifier = ValueNotifier<FeedState>(FeedState.empty);

    set state(FeedState state) => stateNotifier.value = state;
    FeedState get state => stateNotifier.value;

    UserModel? user;
    List<BookModel>? books;

    final repository = FeedRepository();

    void getUser() async {
      state = FeedState.loading;
      user = await repository.getUser();
      state = FeedState.success;

    }
    void getBooks() async{
      state = FeedState.loading;
      books = await repository.getBooks();
      state = FeedState.success;

      
    }


}