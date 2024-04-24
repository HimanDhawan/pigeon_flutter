# Pigeon: Simplifying Flutter Native Code Communication

## Description

The project demonstrate how to use Pigeon in a Flutter project. Follow the steps mentioned above to set up Pigeon, and then integrate it into your Flutter app for seamless communication with native code.

## Why Use Pigeon?

- **Automatic Code Generation:** Pigeon automates the generation of platform-specific code, reducing manual coding efforts and ensuring consistency across platforms.

- **Type Safety:** With strong typing support, Pigeon helps prevent runtime errors by catching type mismatches during compile time.

- **Asynchronous Communication:** Pigeon facilitates seamless asynchronous communication between Flutter and native code, simplifying the handling of asynchronous operations.

- **Reduced Boilerplate:** By eliminating much of the boilerplate code for method invocation and parameter passing, Pigeon results in cleaner and more concise code.

- **Enhanced Readability:** Pigeon abstracts away platform-specific details, promoting cleaner and more readable code, making it easier for developers to understand and maintain.

- **Compatibility with IDEs:** Pigeon integrates well with popular IDEs like Visual Studio Code and Android Studio, providing features such as code completion and syntax highlighting for improved developer productivity.

- **Community Support:** Pigeon is actively maintained and supported by the Flutter community, ensuring ongoing updates and improvements.

- **Scalability:** Pigeon facilitates scalable app development by offering a structured approach to communication between Flutter and native code, making it easier to manage as the project grows.

- **Reduced Error Prone:** By automating code generation and providing type safety, Pigeon helps reduce the likelihood of errors and bugs, resulting in more reliable applications.

- **Future Compatibility:** Pigeon is designed to adapt to future changes and updates in Flutter, providing a robust foundation for long-term app development projects.



## How to Use Pigeon?

1. Add the Pigeon dependency to your `pubspec.yaml` file:
    ```sh
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  pigeon:
      ```
2. Create a new file named pigeon.dart and define model classes to pass data to the native app and receive responses:
    ```sh
        import 'package:pigeon/pigeon.dart';

        @HostApi()
        abstract class MyDataApi {
          @async
          ResponseData sendData(MyData data);
        }

        class MyData {
          String? name;
          int? age;
        }

        class ResponseData {
          String? name;
        }
    ```
3. Run the following command to generate necessary files (pigeon.m, pigeon.h, and pigeon.g.dart):
    
    ```sh
        flutter pub run pigeon \
        --input lib/pigeon.dart \
        --dart_out lib/pigeon.g.dart \
        --objc_header_out ios/Runner/pigeon.h \
        --objc_source_out ios/Runner/pigeon.m
    ```

4. Import pigeon.h and pigeon.m into your Xcode project and add pigeon.h to the Runner-Bridging-Header:


5. Create a new class in Xcode, CustomMyDataAPI, to handle the native API calls:

    ```sh
        public class CustomMyDataAPI: NSObject, MyDataApi {
            public func sendDataData(_ data: MyData, completion: @escaping (ResponseData?, FlutterError?) -> Void) {
                let responseData = ResponseData.init()
                responseData.name = data.name! + "from native"
                completion(responseData,nil)
            }
        }
    ```


6. Import pigeon.g.dart into the Dart file where you want to invoke the native method.

7. Implement a function to invoke the native method:

    ```sh
        Future<void> onClick() async {
            print("on click called");
            MyDataApi v = MyDataApi();
            MyData data = MyData();
            data.name = "john academy";
            data.age = 20;

            ResponseData response = await v.sendData(data);
            setState(() {
              val = response.name ?? "No value received";
            });
        }
    ```

