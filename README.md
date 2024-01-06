# ShareClient

## Getting Started

### Installation

Add the following to your `pubspec.yaml` file:

```yaml

dependencies:
  share_client: ^0.0.1
    git:
      url: https://github.com/arcas0803/share_client.git
      ref: main

```

## Usage

### Import

```dart

import 'package:share_client/share_client.dart';

```

### Methods

#### shareText

```dart

final client = ShareClient();

await client.shareText(text: 'https://www.google.com');

```

#### Share File


```dart

final client = ShareClient();

await client.shareFile(
    path: '/storage/emulated/0/Download/1.jpg',
);


```

#### Share files

```dart

final client = ShareClient();

await client.shareFiles(
    paths: [
        '/storage/emulated/0/Download/1.jpg',
        '/storage/emulated/0/Download/2.jpg',
    ],
);

```



