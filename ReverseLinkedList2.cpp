/*
Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:
Given 1->2->3->4->5->NULL, m = 2 and n = 4,

return 1->4->3->2->5->NULL.

 Note:
Given m, n satisfy the following condition:
1 ≤ m ≤ n ≤ length of list. Note 2:
Usually the version often seen in the interviews is reversing the whole linked list which is obviously an easier version of this question. 
*/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
ListNode* Solution::reverseBetween(ListNode* A, int B, int C) {
    int cnt = 0;
    ListNode* curr = A; 
    ListNode* prev = NULL;
    ListNode* mnode;
    ListNode* nnode; 
    ListNode* next;
    ListNode** ref = &A; 
    ListNode* temphead = *ref; 
        
    //Base testcases: head == NULL
    if(!A) {
        return A;
    }
        
    //m==n no reversing needed
    if(B==C) {
        return A;
    }
        
    //Get Cth node
    curr = A;cnt = 0;
    while(cnt != C-1) {
        //cout << "C loop: currval" << curr->val << "cnt: " << cnt << endl;
        cnt += 1;
        curr = curr->next;
    }
    nnode = curr;
    if(nnode != NULL) {
        prev = nnode->next;
    }
        
    //Get Bth node
    curr = A; cnt = 0;
    while(cnt != B-1) {
        //cout << "B loop: currval" << curr->val << "cnt: " << cnt << endl;
        cnt += 1;
        temphead = curr;
        curr = curr->next;
    }
    mnode = curr;

    //Reverse between B and C nodes
    curr = mnode; 
    while(curr != NULL  && prev != nnode) {
        next = curr->next;
        curr->next = prev;
        prev = curr; 
        curr = next;
    }
    //cout << "Done with reversing; Attaching the head ref" << endl;
    if(B==1) {
        (*ref) = prev;
    }
    else {
        temphead->next = prev;
    }
        
    /*
    ListNode* temp = *ref;
    while(temp != NULL) {
        cout << "tempval: " << temp->val << endl;
        temp = temp->next;
    }
    */
        
    return (*ref);
}
