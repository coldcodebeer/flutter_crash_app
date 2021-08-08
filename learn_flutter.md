- Dart is one of very few languages (and perhaps the only “mainstream” language) that is well suited to **being compiled both AOT and JIT**. Supporting both kinds of compilation provides significant advantages to Dart and (especially) Flutter.
- JIT compilation is used during development, using a compiler that is especially fast. Then, when an app is ready for release, it is compiled AOT. Consequently, with the help of advanced tooling and compilers, Dart can deliver the best of both worlds: extremely fast development cycles, and fast execution and startup times.
- Dart can be compiled into JavaScript so it can be executed by browsers. This allows code reuse between mobile apps and web apps.
- One of the most popular features of Flutter is its extremely fast hot reload. During development, Flutter uses a JIT compiler that can reload and continue executing code usually in under a second.
- Dart’s ability to be AOT compiled to native machine code.Pre-compiled AOT code is more predictable than JIT because there are no pauses during runtime to perform JIT analysis or compilation.
- Dart, like JavaScript, is single threaded, which means it does not allow preemption at all.
- Dart is a client-optimized, garbage-collected, OOP language for creating fast apps that run on any platform.
- In the same way as a Java program can’t be run without the Java Virtual Machine (JVM), a stand-alone Dart program can’t be executed without the Dart Virtual Machine (DVM). There’s the need to download and install the DVM which to execute Dart in a command-line environment.
- AOT compiled. The Ahead Of Time compilation is the act of translating a high-level programming language, like Dart, into native machine code. Basically, starting from the Dart source code you can obtain a single binary file that can execute natively on a certain operating system. AOT is really what makes Flutter fast and portable.
- With AOT there is NO need to have the DVM installed because at the end you get a single binary file (an .apk or .aab for Android, an .ipa for iOS, an .exe for Windows...) that can be executed.
- Thanks to the Flutter SDK you can AOT compile your Dart code into a native binary for mobile, web and desktop.
- Flutter uses its own very efficient rendering engine, called Skia, to paint the UI so that OEM widgets are not needed anymore.In this way, the app doesn’t rely on the instruments the OS exposes to draw the interface and you can freely control each single pixel of the screen.
- a function called main(): the entry point of the application
- When you don’t need a function to return a value, simply make it void like you’d do in Java for example. If you omitted the return type like in (2.), the compiler would automatically append return dynamic at the end of the body.
- typedef VoidCallback = void Function();
- Dart has NO method overload so you cannot have more than a function with the same name.
- Named constructors are generally used to implement a default behavior the user expects from your class.
- They are the only alternative to have multiple constructors since Dart has no method overload.
- cascade notation
  - initialize multiple values of the same objects
  - same even with methods but the returned value, if any, will be ignored
- initializer list
  - with a different name in the constructor
  - It’s executed before the constructor body and thus variables are immediately initialized.
  - No need for nullable types or late

  ```dart
    class Test {
      int _secret;
      double _superSecret;
      Test(this._secret, this._superSecret);
    }

    // It’s basically a way to "rename" internal private properties you don’t want to expose
    class Test {
      int _secret;
      double _superSecret;
      Test(int age, double wallet)
        : _secret = age,
          _superSecret = wallet;
    }
  ```

- subclasses of State cannot define a constructor and you have to perform the initialization of the variables in the initState() method. In order do to this, late is essential

#### Tips:
- you can use final and var to automatically deduce the type
- initialization with var rather than writing the type explicitly
  - making the code shorter
  - increase the readability

  ```dart
    // BAD: hard to read due to nested generic types
    List<List<Toppings>> pizza = List<List<Toppings>>();
    for(List<Toppings> topping in pizza) {
        doSomething(topping);
    }
    // GOOD: the reader doesn't have to "parse" the code
    // It's clearer what's going on
    var pizza = List<List<Toppings>>();
    for(var topping in pizza) {
        doSomething(topping);
    }
  ```

- named parameters
  - pay attention to null-safety in case no given default value
  - the order doesn’t matter but the names of the variables names must be explicit
  - optional parameters must stay at the end of the list
