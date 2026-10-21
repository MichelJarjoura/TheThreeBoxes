<div align="center">

<img src="/assets/icon/icon.png" alt="ThreeBox icon" width="120" height="120" />

![application icon]("assets/icon/icon.png")

# ThreeBox

**Study smarter with active recall and the three-box Leitner system.**

A calm, distraction-free flashcard app that decides when you should see each card again, so you spend your time on what you find hardest.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-3F6F63)
![Status](https://img.shields.io/badge/Status-In%20development-6E9E8F)

</div>

---

## Table of contents

- [About](#about)
- [How it works](#how-it-works)
- [Features](#features)
- [Screens](#screens)
- [Design system](#design-system)
- [Architecture](#architecture)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)

## About

Re-reading notes feels productive, but research shows that **testing yourself** is far more effective. ThreeBox turns that idea into a simple habit: flip a card, answer from memory, and let the app schedule the next review.

It is built on two well-known study techniques:

- **Active recall**: retrieving information from memory instead of re-reading it.
- **Spaced repetition**: reviewing material at growing intervals, using the Leitner system.

## How it works

Every flashcard lives in one of three boxes.

| Box | Contains | Review frequency |
| --- | --- | --- |
| **Box 1: New & tricky** | New cards and cards you got wrong | Every day |
| **Box 2: Getting there** | Cards you answered correctly once | 2–3 times a week |
| **Box 3: Mastered** | Cards you know well | Once a week or less |

```
        correct             correct              correct
 Box 1 ────────▶ Box 2 ────────▶ Box 3 ────────▶ Finished
   ▲                │               │
   └────────────────┴───────────────┘
                 wrong answer
```

- Answer **correctly** and the card moves up one box.
- Answer **wrong** and the card goes back to Box 1.
- A card that passes Box 3 is marked **Finished** and stays available in History.

## Features

- **Three-box review system** with daily, weekly and mastered schedules
- **Focused review sessions** with one card at a time and a progress bar
- **Reveal-then-grade flow**: "Not yet" or "Got it"
- **History** with filters for All, Box 1, Box 2, Box 3 and Finished
- **Quick card creation** from the home screen
- **Calm, minimal interface** with no streak pressure and no clutter

## Screens

| Home | Review | Session complete | History |
| :---: | :---: | :---: | :---: |
| Today's due cards and the three boxes | Flip a card, then grade yourself | A short summary of your session | Filter and browse every card |

> Add screenshots to `docs/screenshots/` and link them here.

## Design system

The interface is soft, rounded and quiet, so it stays out of the way while you study.

**Font:** [Nunito](https://fonts.google.com/specimen/Nunito), loaded with the `google_fonts` package (weights 400, 600, 700, 800).

| Role | Color | Hex |
| --- | --- | --- |
| Background | ![](https://placehold.co/16x16/F3F6F4/F3F6F4.png) | `#F3F6F4` |
| Surface (cards) | ![](https://placehold.co/16x16/FFFFFF/FFFFFF.png) | `#FFFFFF` |
| Text | ![](https://placehold.co/16x16/2C3B37/2C3B37.png) | `#2C3B37` |
| Muted text | ![](https://placehold.co/16x16/566761/566761.png) | `#566761` |
| Primary | ![](https://placehold.co/16x16/3F6F63/3F6F63.png) | `#3F6F63` |
| Box 1 (peach) | ![](https://placehold.co/16x16/F8E4D8/F8E4D8.png) | `#F8E4D8` |
| Box 2 (blue) | ![](https://placehold.co/16x16/DCE9F2/DCE9F2.png) | `#DCE9F2` |
| Box 3 (green) | ![](https://placehold.co/16x16/DCEBE1/DCEBE1.png) | `#DCEBE1` |

All colors live in [`lib/core/theme/app_colors.dart`](lib/core/theme/app_colors.dart).

## Architecture

The code separates presentation, logic, data and navigation:

| Layer | Folder | Responsibility |
| --- | --- | --- |
| Views | `views/` | Screens and reusable widgets |
| Controllers | `controllers/` | State and business logic |
| Bindings | `bindings/` | Set up each screen's dependencies |
| Models | `Models/` | Data classes such as `FlashCard` |
| Routes | `routes/` | Page names and navigation |
| Core | `core/` | Shared theme and constants |

## Project structure

```
lib/
├── main.dart
├── assets/
│   └── icon/
│       ├── icon.png
│       └── icon.svg
├── bindings/
│   ├── history_binding.dart
│   ├── home_binding.dart
│   ├── initial_binding.dart
│   └── review_binding.dart
├── controllers/
│   ├── flashcard_controller.dart
│   ├── history_controller.dart
│   └── review_controller.dart
├── core/
│   └── theme/
│       └── app_colors.dart
├── Models/
│   ├── box-model.dart
│   └── flash_card.dart
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
└── views/
    ├── screens/
    │   ├── history_page.dart
    │   ├── home_page.dart
    │   └── review_page.dart
    └── widgets/
        ├── add_card.dart
        ├── bottom_sheet.dart
        ├── box_card.dart
        ├── flash_card_widget.dart
        ├── primary_button.dart
        ├── start_card.dart
        └── history/
            ├── filter_chip_list.dart
            ├── filter_ship.dart
            ├── history_card.dart
            ├── history_card_list.dart
            └── history_header.dart
```

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) with Dart 3 or newer
- Android Studio or VS Code with the Flutter extension
- An emulator or a physical device

### Installation

```bash
# 1. Clone the repository
git clone <your-repository-url>
cd three_boxes

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### Generate the launcher icon

The app icon is stored at `lib/assets/icon/icon.png` (1024×1024). To generate every Android and iOS size with [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons), add this to `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.14.0

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "lib/assets/icon/icon.png"
```

Then run:

```bash
dart run flutter_launcher_icons
```

## Roadmap

- [x] Three-box review flow
- [x] History with filters
- [ ] Save cards on the device so they persist between sessions
- [ ] Search in History
- [ ] Card detail screen with full answer and review history
- [ ] Review reminders
- [ ] Decks and subjects
- [ ] Import and export cards

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create a branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add your feature"`
4. Push the branch: `git push origin feature/your-feature`
5. Open a pull request

Please keep the interface simple and calm, in line with the design system above.

## License

Distributed under the MIT License. See `LICENSE` for details. *(Replace this if you choose a different license.)*

---

<div align="center">
Made with care for students who want to remember more.
</div>
