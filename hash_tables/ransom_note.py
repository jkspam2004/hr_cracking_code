"""
A kidnapper wrote a ransom note but is worried it will be traced back to him. He
found a magazine and wants to know if he can cut out whole words from it and use 
them to create an untraceable replica of his ransom note. The words in his note 
are case-sensitive and he must use whole words available in the magazine, meaning 
he cannot use substrings or concatenation to create the words he needs.

Given the words in the magazine and the words in the ransom note, print Yes if 
he can replicate his ransom note exactly using whole words from the magazine; 
otherwise, print No.

Input Format

The first line contains two space-separated integers describing the respective 
values of  (the number of words in the magazine) and  (the number of words in the ransom note). 
The second line contains  space-separated strings denoting the words present in the magazine. 
The third line contains  space-separated strings denoting the words present in the ransom note.

Constraints

Each word consists of English alphabetic letters (i.e.,  to  and  to ).
The words in the note and magazine are case-sensitive.
Output Format

Print Yes if he can use the magazine to create an untraceable replica of his ransom note; otherwise, print No.

Input 1:

6 4
give me one grand today night
give one grand today

Output 1:
Yes
Explanation:
All four words needed to write an untraceable replica of the ransom note are 
present in the magazine, so we print Yes as our answer.

Input 2:
6 5
give me one grand today night
give one grand grand today

Output:
No
Explanation:
only one "grand" in the magazine and the ransom uses two

"""

class Solution(object):
    def ransom_note(self, magazine, ransom):
        magazine_dict = {}
        for word in magazine:
            count = magazine_dict.get(word, 0)
            magazine_dict[word] = count + 1
           
        for word in ransom:
            if word in magazine_dict and magazine_dict[word] > 0:
                magazine_dict[word] -= 1
            else:
                return False
                
        return True

if __name__ == "__main__":
    m, n = map(int, input().strip().split(' '))
    magazine = input().strip().split(' ')
    ransom = input().strip().split(' ')

    s = Solution()
    answer = s.ransom_note(magazine, ransom)
    if(answer):
        print("Yes")
    else:
        print("No")
