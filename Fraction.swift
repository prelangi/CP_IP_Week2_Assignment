/*
Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.

If the fractional part is repeating, enclose the repeating part in parentheses.

Example :

Given numerator = 1, denominator = 2, return "0.5"
Given numerator = 2, denominator = 1, return "2"
Given numerator = 2, denominator = 3, return "0.(6)"
*/


import Foundation

class Solution {
	func fractionToDecimal(_ A: inout Int, _ B: inout Int) -> String {
        var negative = false
        var result: String = ""
        var numbersInFraction = [Int:Int]()
        var idx = 0
        
        if((A < 0 && B > 0) || (A>0 && B<0)) {
            negative = true
        }
        
        if(negative) {
            result += "-"
        }
        
        var num = abs(A) 
        var den = abs(B) 
        var integerPart = num/den
        result += String(integerPart)
        
        if(num % den != 0) {
            result += "."
            idx = result.count
            num = num%den
            numbersInFraction[num] = result.count
            
            while(num != 0) {
                num = 10*num
                var newNum = num/den
                result += String(num/den)
                num = num%den
                
                var keyExists = numbersInFraction[num] != nil 
                if(keyExists) {
                    var prevIndex = numbersInFraction[num]!
                    result += ")"
                    var idxforbracket = result.index(result.startIndex, offsetBy:prevIndex)
                    result.insert("(",at:idxforbracket)
                    break;
                }
                else {
                    numbersInFraction[num] = result.count
                }
            }
            
        }
        
        return result
	}
}
