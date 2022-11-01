part of 'shared.dart';

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.gallery);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  TaskSnapshot snapshot = await task.whenComplete(() => null);

  return await snapshot.ref.getDownloadURL();
}
