import 'package:flutter/material.dart';
import 'package:hds_app/provider/auth_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const questions = [
  'What is the weather like today?',
  'Can you tell me a joke?',
  'What is the meaning of life?',
];

const categories = ['General', 'Weather', 'Jokes', 'Other'];

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [];

  String userName = 'ggggg';

  //String userName = '';
  String selectedCategory = categories[0];


  DateTime now = DateTime.now();

String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
  String  userEmail = userProvider.user!.name; // Assuming userProvider has a `user` with an `email` property
    _messages.add(ChatMessage(
      text: 'Hi,$userEmail. What can I help you with today?',
      isUser: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
        final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Katsha GPT325'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  items: categories
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedCategory = value!),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _handleSubmitted(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _handleSubmitted(_messageController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String message) {
    _messageController.clear();
    ChatMessage chatMessage = ChatMessage(
      text: message,
      isUser: true,
    );
    setState(() {
      _messages.add(chatMessage);
    });

    // Simulate a response from the chatbot after a short delay
    Future.delayed(Duration(seconds: 2), () {
      _handleBotResponse(message, selectedCategory);
    });
  }

  void _handleBotResponse(String userMessage, String category) {
    String botResponse = '';

    if (userName.isEmpty) {
      userName = userMessage;
      botResponse = 'Hello! What is your name and how can I assist you today?';

      
    } else {
      switch (category) {
        case 'General':
          if (userMessage.contains('question')) {
            botResponse = 'Sure, ask me anything!';
          } else if (userMessage.contains('name')) {
            botResponse = 'My name is Katsha GPT325';
          } else if (userMessage.contains('how are you')) {
            botResponse = 'I\'m doing great, thanks!';
          }
          
          else if (userMessage.contains('help')) {
            botResponse = 'Here are some things I can do: ';
            botResponse += '- Answer questions about different topics.';
            botResponse += ' Tell jokes';
            botResponse += ' Give you the weather forecast';
            botResponse += ' Help you create a sign in and sign up page';
          } else if (userMessage.contains("create an account")) {
            botResponse =
                'There are many things I can do for you. Do you want me to create an account for you or do you want to sign in?';
          } else if (userMessage.contains("sign in")) {
            botResponse = 'Please enter your email and password';
          } else if (userMessage
              .contains("give me a suggestion of what I can eat")) {
            botResponse =
                'I have helped you curate list of meals that you can choose from. Please select one of the following: Cookies and Milk, Pizza, Burger, Chicken and Chips, Spaghetti and Meatballs, Chicken and Rice, Amala and Egusi. What else can I help you with?';
          } else if (userMessage.contains("Cookies and Milk")) {
            botResponse =
                'I have helped you curate list of meals that you can choose from. Please select one of the following: Cookies and Milk, Pizza, Burger, Chicken and Chips, Spaghetti and Meatballs, Chicken and Rice, Amala and Egusi. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';
          } else if(userMessage.contains("thank you")){
            botResponse = 'You are welcome. What else can I help you with?';

          }else if(userMessage.contains("what is the date and time")){
            botResponse = 'The date and time is: ${formattedDateTime}';
          }
          
        
          
          else {
            botResponse = 'Hmm, I\'m not sure what you mean.';
          }
          break;
        case 'Weather':
          // Fetch weather data or use a placeholder response
          botResponse = 'Currently, it\'s... (insert weather information).';
          break;
        case 'Jokes':
          botResponse =
              'What did the chicken cross the road to do? To get to the other side!';
          // Add more jokes to the list!
          break;
        case 'Other':
          // Handle other questions based on keywords or sentiment
          if (userMessage.contains('meaning of life')) {
            botResponse = 'That\'s a deep question! Have you considered...';
          } else if (userMessage.contains("how do I solve this problem")) {
            botResponse = 'I can help you with that. What is the problem?';
          } else {
            botResponse =
                'Sorry, I\'m still learning about that. Can you tell me more?';
          }
          break;
      }
    }

    ChatMessage chatMessage = ChatMessage(
      text: botResponse,
      isUser: false,
    );
    setState(() {
      _messages.add(chatMessage);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}
