import '../models/guest.dart';

int count(List guests) {
  int guestCount = 2;
  // Count guests
  for (Guest i in guests) {
    if (i.hasFriend == true) {
      guestCount += 1;
      print("${i.name}+one, 2 persons");
    } else {
      print("${i.name}, 1 person");
    }
    guestCount += 1;
  }
  // Make sure that the number of people does not equal 13
  if (guestCount == 13) {
    print("! Add dummy as guest");
    guestCount += 1;
  }
  return guestCount;
}