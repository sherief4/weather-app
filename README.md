<h1>Weather App</h1>

> This project is powered by FLutter **3.0.5** and dart **2.17.6**. And is built using [Weather Api](https://www.weatherapi.com/).

To select and install a specific version of flutter, I recommend using FVM: [fvm.app](https://fvm.app)

Bloc ( [ flutter_bloc ](https://pub.dev/packages/flutter_bloc) ) is used as an approach to state management, more precisely Cubit over Bloc from the same package. Bloc/Cubit handles `Events` and changes `States`. Screens and Widgtes subscribe to Bloc changes and send events (for Cubit, this is a direct method call).

The main packages used in the project:

```yaml
    cupertino_icons: ^1.0.2
    bloc: ^8.1.0
    lottie: ^1.4.1
    geolocator: ^9.0.1
    intl: ^0.17.0
    flutter_bloc: ^8.1.1
    shared_preferences: ^2.0.15
    http: ^0.13.5
    get_it: ^7.2.0
    internet_connection_checker: ^0.0.1+4
    equatable: ^2.0.5
    syncfusion_flutter_charts: ^20.2.48
    dartz: ^0.10.1
```

### Table of Contents
1. [How to build & run]
2. [Screenshots](#screenshots)
3. [Demo video](#demo-video)
4. Apk


## build&run

- Before everything add your own api key by changing API_KEY located at lib/core/strings/end_points 
- You can get your own api key please visit: [Weather Api](https://www.weatherapi.com/) 

The minimum required set of commands


```bash
- flutter pub get # to get dependencies
- flutter pub run intl_utils:generate # to generate l10n.dart file from .arb localization files 
- flutter pub run build_runner build --delete-conflicting-outputs # to generate JsonSerializable models
```

To build and run the project, you can use `Android Studio` or `Visual Studio Code` with Flutter/Dart plugins (`Flutter Intl`, `Dart`, `Flutter`), then the commands above will be executed automatically when building and running.


To build from console:

```bash
 flutter build ios --release --no-codesign --flavor dev
 # or
 flutter build android --release --flavor dev
```

You can assemble the flutter part separately and run the application from native projects

To run from console:

```bash
flutter run ios -t lib/main.dart --no-codesign --flavor dev
# or
flutter run android -t lib/main.dart --flavor dev
```

``lib/main.dart`` - this is the main launch point of the project

``--flavor dev `` - this is the environment specification for dart + `flavor` in Android and `scheme` in iOS native projects


## Screenshots
<details>
<summary> See screenshots </summary>
<table>
  <tr>
     <td> No Data Error Page </td>
     <td> Loading Screen </td>
  </tr>
  <tr>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/1.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/2.jpg" width=202 height=405> </td>
  </tr>
 </table>
<table>
  <tr>
     <td>Home Page</td>
     <td> Home Page Scroll</td>
     <td> Home Page Scroll</td>
  </tr>
  <tr>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/3.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/4.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/4-1.jpg" width=202 height=405> </td>
  </tr>
 </table>
<table>
  <tr>
     <td>Home Drawer</td>
     <td>Report Wrong Location</td>
     <td>Contact Us Page</td>
  </tr>
  <tr>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/5.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/6.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/7.jpg" width=202 height=405> </td>
  </tr>
 </table>
<table>
  <tr>
     <td>Manage Locations Page</td>
     <td>Search Result Page</td>
     <td>Home Drawer</td>
  </tr>
  <tr>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/9.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/8.jpg" width=202 height=405> </td>
    <td><img src = "https://github.com/sherief4/weather-app/blob/main/resources/10.jpg" width=202 height=405> </td>
  </tr>
 </table>
</details>

[Download Apk](https://drive.google.com/file/d/1IIueGic7Joajy1r8rB3e_ydJWxN3B5ug/view?usp=sharing)

## Demo video

[Demo Video](https://drive.google.com/file/d/14Xbp23fImNdpqmIyKaeYruJCtbYOqCrl/view?usp=sharing)
