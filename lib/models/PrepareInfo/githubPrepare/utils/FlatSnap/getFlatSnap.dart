import 'package:html/dom.dart';
import 'flat_snap_selectors.dart';

class getFlatSnap {

  List<String?> FlatSnap(Document document){

    final String? flatpak_badge_URL = FlatSnapSelectors().flatpakSelector(document);
          
    final String? flat_snap_Badges = FlatSnapSelectors().flatpakSelector2(document);

    final String? flatpakMarker = FlatSnapSelectors().flatpakselector3(document);

    final String? snap_badge_URL = FlatSnapSelectors().snapSelector(document);
    
    final String? snapMarker = FlatSnapSelectors().snapSelector2(document);

    final List<String?> FlatSnap = [
      flatpak_badge_URL,
      flat_snap_Badges,
      flatpakMarker,
      snap_badge_URL,
      snapMarker
    ];

    return FlatSnap;
  }
}