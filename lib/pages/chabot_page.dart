import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class ChabotPage extends StatefulWidget {
  // ChabotPage({Key key, this.title}) : super(key: key);

  final String title;
  ChabotPage({this.title});

  @override
  _ChabotPage createState() => new _ChabotPage();
}

class _ChabotPage extends State<ChabotPage> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    AuthProvider userProvider = Provider.of<AuthProvider>(context);

    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credential.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Promise",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        title: Text("chatbot"),
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white60,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // NOTE : PENGENALAN CHATBOT

              _messages.length == 0
                  ? Image.asset(
                      'assets/logo_chatbot.png',
                      width: 50,
                    )
                  : SizedBox(),
              _messages.length == 0
                  ? Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 60),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            child: Text(
                                "hello! My name is irle, i will be your friend to practice your english, i have some interesting topic like : \n 1. food \n 2. hobbies \n 3. daily activity"),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),

              Flexible(
                  child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              )),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ]),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
          width: 50,
          // color: primaryColor,
          margin: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
              backgroundColor: whiteColor,
              child: Image.asset('assets/logo_chatbot.png'))),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: textStyle1.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child:
                      Container(padding: EdgeInsets.all(8), child: Text(text))),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    AuthProvider userProvider = Provider.of<AuthProvider>(context);
    GetStorage box = GetStorage();
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              this.name,
              style: textStyle1.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Container(
                      padding: EdgeInsets.all(8),
                      child:
                          Text(text, style: TextStyle(color: Colors.white)))),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            // userProvider.user.profilePhotoUrl,
            box.read('image'),
          ),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
