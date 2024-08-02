
enum PaymentState {
  Pending,
  processing,
  done,
  refunded;
}

void main(List<String> args) {
  int payemnt = 1;
  switch (payemnt) {
    case 1:
      print(PaymentState.Pending);
  }
}
