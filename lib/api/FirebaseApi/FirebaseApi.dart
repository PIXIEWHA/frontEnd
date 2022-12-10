import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixie/api/FirebaseApi/FirebaseFile.dart';

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  Future<ListResult> listVideo() async {
    FirebaseStorage firebase_storage = FirebaseStorage.instance;
    ListResult result =
        await firebase_storage.ref().list(ListOptions(maxResults: 10));

    if (result.nextPageToken != null) {
      ListResult additionalResults =
          await firebase_storage.ref().list(ListOptions(
                maxResults: 10,
                pageToken: result.nextPageToken,
              ));
    }
    return result;
  }

  static Future downloadFile(Reference ref) async {
    FirebaseStorage firebase_storage = FirebaseStorage.instance;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await firebase_storage.ref(ref.fullPath).writeToFile(file);
  }
}
