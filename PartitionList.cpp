/*
Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

For example,
Given 1->4->3->2->5->2 and x = 3,
return 1->2->2->4->3->5.
*/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
ListNode* Solution::partition(ListNode* A, int B) {
    //Maintain a less list and more list and merge them together
        ListNode* less = new ListNode(0);
        ListNode* more = new ListNode(0);
        ListNode* currhead = A;
        ListNode* prevless = NULL, *prevmore = NULL;
        ListNode *result;
        
        ListNode* lesshead = NULL;
        ListNode* morehead = NULL;
        int lesscnt = 0,morecnt = 0;
        
        if(A==NULL) {
            return NULL;
        }
        
        while(currhead != NULL) {
            
            //Add to the less list
            if(currhead->val < B) {
                less->val = currhead->val;
                less->next = new ListNode(0);
                
                if(lesscnt==0) {
                    lesshead=less;
                }
                prevless = less;
                less = less->next;
                lesscnt += 1;
            }
            else {
                
                
                more->val = currhead->val;
                more->next = new ListNode(0);
                
                if(morecnt==0) {
                    morehead = more;
                }
                morecnt += 1;
                prevmore = more;
                more = more->next;
            }
            
            currhead = currhead->next;
        }
        
        
        //Merge them together
        if(lesscnt) {
             prevless->next = morehead;
             if(prevmore) {
                 prevmore->next = NULL;
             }
            
             result =  lesshead;
        }
        else {
            if(prevmore) {
                prevmore->next = NULL;
            }
            result =  morehead;
        }
        
        return result;
}
