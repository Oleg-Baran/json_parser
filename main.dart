import 'helpers/count_guests.dart';
import 'helpers/guest_file_service.dart';

void main() async {
  await GuestFileService().writeGuestsToJsonFile();
  final res = await count(await GuestFileService().readGuestsFromJsonFile());
  print("\nTotal guests: ${res - 2} + 2 hosts");
  print("Cost ot lunch: ${res * 100}\$");
}
