/*
Multimaps
One common pattern when using hash tables requires building a Map whose values are Collection instances. In this challenge, we'll take the output of the previous challenge and invert it.

Write a program that takes as its input a HashMap<String,Integer> and returns a HashMap<Integer,HashSet<String>> containing the same data as the input map, only inverted, such that the input map's values are the output map's keys and the input map's keys are the output map's values.

Example:

Consider the example output for Challenge #4. Using that map as the input, the output for this challenge would be:

2 → ["to", "be"]
1 → ["or", "not", "that", "is", "the", "question"]
*/

func reverseWordMap(_ wordMap: [String:Int]) -> [Int:Set<String>] {
    var rwm = [Int:Set<String>]()
    for (key,values) in wordMap {
        var keyExists = false
        if rwm[values] != nil {
            keyExists = true
        }
        
        if !keyExists {
            var words = Set<String>()
            words.insert(key)
            rwm[values] = words
        }
        else {
            rwm[values]!.insert(key)
        }
        
    }
    
    return rwm
}
