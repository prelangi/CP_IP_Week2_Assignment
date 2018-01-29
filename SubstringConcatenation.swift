/*
You are given a string, S, and a list of words, L, that are all of the same length.

Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.

Example :

S: "barfoothefoobarman"
L: ["foo", "bar"]
You should return the indices: [0,9].
(order does not matter).
*/

import Foundation

class Solution {
	func findSubstring(_ A: inout String, _ B: [String]) -> [Int] {
        var result = [Int]()
        var wordhash = [String:Int]()
        var numwords = B.count
    
    
        //Algorithm
        //1. Hash the words given in "words" array
        //2. Iterate wordsize times over the given string
        //3. Use a sliding window approach and two hashes to optimize the performance
        //   Whenever the hash of substrings is greater than word hash, the left pointer needs to be incremented until they are made equal
        //   left is the starting of the sliding window
        //   offset2 is the current end of the substring we are considering. 
        
        //Base case scenarios
        if (A.count==0 || numwords==0) {
            return result
        }
       
        var wordsize = B[0].count
        var str2matchl = wordsize*numwords
        if (A.count < str2matchl) {
            return result
        }
        
        //string matches the word
        if(B.count==1 && B[0]==A) {
            result.append(0)
            return result
        }
        
        //Wordhash
        for i in 0..<numwords {
            let keyExists = wordhash[B[i]] != nil
            if(keyExists) {
                wordhash[B[i]]! += 1
            }
            else {
                wordhash[B[i]] = 1
            }
        }
        
        var endindex = A.count - wordsize
        var idx = 0
        
        while(idx<wordsize) {
            var left = idx, count = 0
            var j = idx
            var substringhash = [String:Int]()
            while(j<=endindex) {
                var offset1 = j
                var offset2 = j + wordsize
                var startIdx = A.index(A.startIndex, offsetBy:offset1)
                var endIdx = A.index(A.startIndex, offsetBy:offset2)
                var substr = String(A[startIdx..<endIdx])
                //print("substring: \(substr), idx: \(idx), j: \(j), offset1: \(offset1), offset2: \(offset2),left: \(left)")
                var keyExists = substringhash[substr] != nil 
                var keyExistsInWordHash = wordhash[substr] != nil
                
                //if the substring is not present in the word hash,it is no longer 
                //necessary to consider the substring
                if !keyExistsInWordHash {
                    substringhash.removeAll()
                    count = 0
                    left = j + wordsize
                }
                else {
                    //print("substr: \(substr), count: \(count)")
                    if keyExists {
                        substringhash[substr]! += 1
                    }   
                    else {
                        substringhash[substr] = 1
                    }
                    
                    if (substringhash[substr]! <= wordhash[substr]!) {
                        //print("Incrementing cnt")
                        count += 1
                    }
                    else {
                        //print("Substringhash of word: \(substr) is greater than wordhash")
                        while(substringhash[substr]! > wordhash[substr]!)   {
                            var leftIndex = A.index(A.startIndex,offsetBy:left)
                            var leftEndIndex = A.index(leftIndex,offsetBy:wordsize)
                            var substr1 = String(A[leftIndex..<leftEndIndex])
                            //print("Reducing hash cnt of sub string: \(substr1), curr_count: \(count)")
                            substringhash[substr1]! -= 1
                        
                            if (substringhash[substr1]! < wordhash[substr1]!) {
                                //print("Reducing cnt value")
                                count -= 1
                            }
                        
                            left += wordsize
                        }
                        
                    }

                    
                    if (count == numwords) {
                        //print("Appending \(left) idx to result array")
                        result.append(left)
                        
                        var leftIndex = A.index(A.startIndex,offsetBy:left)
                        var leftEndIndex = A.index(leftIndex,offsetBy:wordsize)
                        var substr1 = String(A[leftIndex..<leftEndIndex])
                        
                        substringhash[substr1]! -= 1
                        left += wordsize
                        count -= 1
                        
                    }
                    
                } //when key exists in wordhash
                j += wordsize
            }
            idx += 1
        }
        
        return result
	}
}
