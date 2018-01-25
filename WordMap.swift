/*
Write a program which takes as its input a String of natural language text and outputs a HashMap<String,Integer> whose keys are the unique words in the input and whose values are the number of times those words occur. The algorithm should be case-insensitive (e.g. "Program" and "program" would count as the same word) and ignore punctuation and whitespace.

Example: Given the input "To be or not to be, that is the question", the outputted HashMap would contain 8 entries, with two words having a count of 2 and six words having a count of 1:

"to"        → 2
"be"        → 2
"or"        → 1
"not"       → 1
"that"      → 1
"is"        → 1
"the"       → 1
"question"  → 1
*/

func getWordMap(_ sentence: String) -> [String:Int] {
    let words = sentence.lowercased().components(separatedBy:.punctuationCharacters).joined().components(separatedBy: .whitespaces)
    var wordMap = [String:Int]()
    print(words)
    
    for word in words {
        var keyExists = wordMap[word] != nil
        if keyExists {
            wordMap[word]! += 1
        }
        else {
            wordMap[word] = 1
        }
    }
    
    return wordMap
}

print(getWordMap("To be or not to be, that is the question!"))
