Stream<int> getNumbers() async* {
  for (int i = 0; i < 5; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
    // if (i == 2) {
    //   throw Exception('An error occurred');
    // }
  }
}

void main(List<String> args) {
 

  var subscription = getNumbers().listen((event) {
    print(event);
  });

  subscription.onData((data) {
    print('second data: $data');
  });

  subscription.onError((err) {
    print(err);
  });

  subscription.onDone(() {
    print('Stream is done.');
  });
}
