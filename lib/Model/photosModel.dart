class PhotosModel {
  String imgSrc;
  String PhotoName;

  PhotosModel({required this.imgSrc, required this.PhotoName});

  static PhotosModel fromApitoApp(Map<String, dynamic> photoMap) {
    return PhotosModel(
        imgSrc: (photoMap["src"])["portrait"],
        PhotoName: photoMap['photographer']);
  }
}
