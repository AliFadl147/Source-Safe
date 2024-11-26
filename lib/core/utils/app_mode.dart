enum ModeType { dark, light }

const bool light = false;
const bool dark = true;

extension ModeTypeExtension on ModeType {
  bool getValue() {
    switch (this) {
      case ModeType.dark:
        return dark;
      case ModeType.light:
        return light;
    }
  }
}
