import 'package:json_parser_freezed/helpers/count_guests.dart';
import 'package:json_parser_freezed/helpers/guest_file_service.dart';

void main() async {
  await GuestFileService().writeGuestsToJsonFile();
  final res = await count(await GuestFileService().readGuestsFromJsonFile());
  print("\nTotal guests: ${res - 2} + 2 hosts");
  print("Cost ot lunch: ${res * 100}\$");
}