import 'package:html/dom.dart';

class FlatSnapSelectors {

  //Flatpak selectors

  String? flatpakSelector(Document document) {

    final Element? flatpak_image_Element = document.querySelector(
        'img[data-canonical-src="https://flathub.org/assets/badges/flathub-badge-en.png"]');

    final String? flatpak_badge_URL = flatpak_image_Element?.attributes['data-canonical-src'] ?? 'flat is not supported';

    return flatpak_badge_URL;
  }

  String? flatpakSelector2(Document document) {
    
    final String flat_snap_Badges = document.querySelectorAll('img[data-canonical-src]')
          .map((flat_snap) => flat_snap.attributes['data-canonical-src'])
          .toString()
          .toLowerCase();

    return flat_snap_Badges;      
  } 

  String? flatpakselector3(Document document) {

    String? flatpak_snapTextChecker = document.body!.text.toLowerCase();

    String flatpakMarker = '';

    if (flatpak_snapTextChecker.contains('flatpak')) {
      flatpakMarker = 'flatpak';
    }

    return flatpakMarker;
  }


  //Snap selectors

  String? snapSelector(Document document) {
    
    final Element? snap_image_Element = document.querySelector('img[data-canonical-src="https://snapcraft.io/static/images/badges/en/snap-store-black.svg"]');
          
    final String? snap_badge_URL = snap_image_Element?.attributes['data-canonical-src'] ?? 'snp is not supported';

    return snap_badge_URL;
  }

  String? snapSelector2(Document document) {
    
    String? flatpak_snapTextChecker = document.body!.text.toLowerCase();

    String snapMarker = '';

    if (flatpak_snapTextChecker.contains('snap')) {
      snapMarker = 'snap';
    }

    return snapMarker;
  }
}
