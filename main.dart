import 'helpers/count_guests.dart';
import 'helpers/json_operations.dart';

void main() async {
  var res = await count(await Json().fromJson());
  print("\nTotal guests: ${res - 2} + 2 hosts");
  print("Cost ot lunch: ${res * 100}\$");
}
