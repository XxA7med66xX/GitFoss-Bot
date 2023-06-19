
class PlatformsAutoSort {
  bool isAppImage = false;
  bool isGnome_extention = false;
  bool isFlatpak = false;
  bool isSnap = false;
  List<dynamic> ProjectReleases;

  PlatformsAutoSort({required this.ProjectReleases});

  List<String> AutoSort() {
    
    List<String> supportedPlatforms = [];

    List<Map<String, dynamic>> platforms = [
      {
        'name': 'لينكس',
        'extensions': [
          'AppImage',
          'rpm',
          'pacman',
          'Ubuntu',
          'deb',
          'linux',
          '@',
          'gnome-shell-extension',
          'flathub',
          'flatpak',
          'snap',
          'snapcraft',
          'bin',
          'wine',
        ]
      },
      {
        'name': 'ويندوز',
        'extensions': [
          'exe',
          'msi',
          'cmd',
          'bat',
          'windows',
          'win64',
          'appx',
          'msix'
        ]
      },
      {
        'name': 'ماك',
        'extensions': ['dmg', 'macos', 'mac', 'apple', 'darwin', 'bin']
      }
    ];

    for (Map<String, dynamic> platform in platforms) {
      bool isSupported = false;
      for (String extension in platform['extensions']) {
        if (ProjectReleases.any(
            (releaseTitle) => releaseTitle.contains(extension))) {
          isSupported = true;
          if (extension.contains('AppImage') && extension.contains('flathub')) {
            isAppImage = true;
            isFlatpak = true;
          } else if (extension.contains('AppImage')) {
            isAppImage = true;
          } else if (extension.contains('gnome-shell-extension')) {
            isGnome_extention = true;
          } else if (extension.contains('@')) {
            isGnome_extention = true;
          } else if (extension.contains('flathub')) {
            isFlatpak = true;
          } else if (extension.contains('flatpak')) {
            isFlatpak = true;
          } else if (extension.contains('snap')) {
            isSnap = true;
          } else if (extension.contains('snapcraft')) {
            isSnap = true;
          }
        }
      }
      if (isSupported) {
        supportedPlatforms.add(platform['name']);
      }
    }
    return supportedPlatforms;
  }
}
