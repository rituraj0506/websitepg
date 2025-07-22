class GalleryImage {
  final String imagePath;
  final String caption;

  GalleryImage({required this.imagePath, this.caption = ""});
}



final List<GalleryImage> galleryImages = [
  GalleryImage(imagePath: 'asset/basketball.png', caption: 'Basket Ball'),
  GalleryImage(imagePath: 'asset/library.png', caption: 'Library'),
  GalleryImage(imagePath: 'asset/purisabji.jpg', caption: 'Healthy Food'),
  GalleryImage(imagePath: 'asset/friedrice.jpg', caption: 'Healthy Food'),
  GalleryImage(imagePath: 'asset/cafeteria.png', caption: 'CafeTeria'),
  GalleryImage(imagePath: 'asset/ro.jpg', caption: 'RO Water'),
  GalleryImage(imagePath: 'asset/wifi.jpg', caption: 'Wifi'),
  GalleryImage(imagePath: 'asset/friedrice.jpg', caption: 'Fried Rice'),
  // Add more images here...
];