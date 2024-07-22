main() {
  // even number (4%2 == 0) is equal to 0 //
  // factorial 6*5*4*3*2*1 = 720
  for (int m = 0; m < 4; m++) {
    if (m == 2) {
      continue;
    }
    for (int s = 0; s < 60; s++) {
      print('$m : $s');
    }
  }
}
