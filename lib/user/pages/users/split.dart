List<String> splitStringBySpace(String input) {
  // Split the string by spaces and return the array of words
  return input.split(' ');
}

void main() {
  String sentence = "This is a sample string";

  // Call the function to split the string
  splitStringBySpace(sentence);

  // Print the resulting array
  //print(words);
}
