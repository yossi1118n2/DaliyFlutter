import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line/scr/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Chatpage extends StatefulWidget {
  String name;
  String uid;
  Chatpage({Key? key, required this.name, required this.uid}) : super(key: key);

  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  StreamSubscription<QuerySnapshot>? _guestBookSubscription;
  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessages => _guestBookMessages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ListView(
            children: <Widget>[
                Row(
                    children: [
                      Container(child: Text('ID'), width: 50,),
                      Container(child: Text(':'), width: 20),
                      Text(widget.uid),
                    ]
                ),
                Padding(padding: EdgeInsets.all(10),),
                Row(
                  children: [
                    Container(child: Text('PM'), width: 50),
                    Container(child: Text(':'), width: 20),
                    Text('毎回同じパスワードを表示'),
                  ],
                ),
              GuestBook(
                addMessage: (String message) =>
                    addMessageToGuestBook(message),
                messages: _guestBookMessages, // new
              ),

            ]
        ),
    );
  }


  Future<DocumentReference> addMessageToGuestBook(String message) {
    print("addMessageToGuestBook");
    FirebaseAuth.instance.userChanges().listen((user) {
      _guestBookSubscription = FirebaseFirestore.instance
          .collection('guestbook')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        _guestBookMessages = [];
        print("listen");
        snapshot.docs.forEach((document) {
          _guestBookMessages.add(
            GuestBookMessage(
              name: document.data()['name'] as String,
              message: document.data()['text'] as String,
            ),
          );
        });
      });
    });

    return FirebaseFirestore.instance.collection('guestbook').add(
        <String, dynamic>{
          'text': message,
          'timestamp': DateTime
              .now()
              .millisecondsSinceEpoch,
          'name': widget.name,
          'userId': widget.uid,
        });
  }
}


class GuestBookMessage {
  GuestBookMessage({required this.name, required this.message});
  final String name;
  final String message;
}

// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//
//   // Add from here
//   Future<DocumentReference> addMessageToGuestBook(String message) {
//
//     return FirebaseFirestore.instance.collection('guestbook').add(<String, dynamic>{
//       'text': message,
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//       'name': FirebaseAuth.instance.currentUser!.displayName,
//       'userId': FirebaseAuth.instance.currentUser!.uid,
//     });
//   }
//   // To here
//
//   Future<void> init() async {
//     await Firebase.initializeApp();
//
//     //リスナー
//     // FirebaseのAuth libralyはこのcallbackが必要。
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         // Add from here
//         _guestBookSubscription = FirebaseFirestore.instance
//             .collection('guestbook')
//             .orderBy('timestamp', descending: true)
//             .snapshots()
//             .listen((snapshot) {
//           _guestBookMessages = [];
//           snapshot.docs.forEach((document) {
//             _guestBookMessages.add(
//               GuestBookMessage(
//                 name: document.data()['name'] as String,
//                 message: document.data()['text'] as String,
//               ),
//             );
//           });
//           notifyListeners();
//         });
//
//         // to here.
//       } else {
//         _guestBookMessages = [];
//         _guestBookSubscription?.cancel();
//       }
//       notifyListeners();
//     });
//   }
//
//   String? _email;
//   String? get email => _email;
//
//   // Add from here
//   StreamSubscription<QuerySnapshot>? _guestBookSubscription;
//   List<GuestBookMessage> _guestBookMessages = [];
//   List<GuestBookMessage> get guestBookMessages => _guestBookMessages;
//   // to here.
//
//   void startLoginFlow() {
//     notifyListeners();
//   }
//
//   void verifyEmail(
//       String email,
//       void Function(FirebaseAuthException e) errorCallback,
//       ) async {
//     try {
//       var methods =
//       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signInWithEmailAndPassword(
//       String email,
//       String password,
//       void Function(FirebaseAuthException e) errorCallback,
//       ) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void cancelRegistration() {
//     notifyListeners();
//   }
//
//   void registerAccount(String email, String displayName, String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user!.updateProfile(displayName: displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }

class GuestBook extends StatefulWidget {
  // Modify the following line
  GuestBook({required this.addMessage, required this.messages});
  final FutureOr<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages; // new

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Leave a message',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your message to continue';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  StyledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await widget.addMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.send),
                        SizedBox(width: 4),
                        Text('SEND'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          for (var message in widget.messages)
            Paragraph('${message.name}: ${message.message}'),
          SizedBox(height: 8),
        ]
    );
  }
}