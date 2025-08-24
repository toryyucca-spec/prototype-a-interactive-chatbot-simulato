Bash
#!/bin/bash

# Configuration file for Eis1 Interactive Chatbot Simulator

# Set the chatbot's personality
PERSONALITY="Friendly"

# Set the chatbot's language
LANGUAGE="en_US"

# Set the chatbot's knowledge base
KNOWLEDGE_BASE="./knowledge_base.txt"

# Set the chatbot's response delay (in seconds)
RESPONSE_DELAY=2

# Set the chatbot's greeting message
GREETING_MESSAGE="Hello! I'm Eis1, your friendly chatbot. How can I assist you today?"

# Set the chatbot's farewell message
FAREWELL_MESSAGE="It was nice chatting with you! Have a great day!"

# Define the chatbot's intents
INTENTS=(
  "greeting"
  "goodbye"
  "help"
  "joke"
  "weather"
)

# Define the chatbot's responses
RESPONSES=(
  "Hi, how are you?"
  "See you later!"
  "How can I assist you?"
  "Here's a joke: Why was the math book sad? Because it had too many problems."
  "The weather is beautiful today!"
)

# Define the chatbot's conversation flow
CONVERSATION_FLOW=(
  "greeting:response[0]"
  "goodbye:response[1]"
  "help:response[2]"
  "joke:response[3]"
  "weather:response[4]"
)

# Function to process user input
process_input() {
  # Get user input
  read -p "You: " user_input

  # Determine the intent of the user input
  intent=$(echo "$user_input" | grep -oE "hello|hi|hey|greeting" && echo "greeting" || 
             echo "$user_input" | grep -oE "bye|goodbye|see you later" && echo "goodbye" ||
             echo "$user_input" | grep -oE "help|assist" && echo "help" ||
             echo "$user_input" | grep -oE "joke" && echo "joke" ||
             echo "$user_input" | grep -oE "weather" && echo "weather")

  # Respond to the user input based on the intent
  case "$intent" in
    "greeting")
      echo "$GREETING_MESSAGE"
      ;;
    "goodbye")
      echo "$FAREWELL_MESSAGE"
      exit 0
      ;;
    "help")
      echo "I can assist you with various tasks. What do you need help with?"
      ;;
    "joke")
      echo "${RESPONSES[3]}"
      ;;
    "weather")
      echo "${RESPONSES[4]}"
      ;;
    *)
      echo "I didn't understand that. Can you please rephrase?"
      ;;
  esac
}

# Main loop
while true
do
  process_input
  sleep "$RESPONSE_DELAY"
done