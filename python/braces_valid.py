'''
Braces valid:
Given a string of brackets/braces/parens, determine if they are valid (matching open and closing pairs)
'''

def braces_valid(values):
    result = []
    for string in values:
        #print(string)
        #chars = list(string)
        chars = string
        stack = []
        valid = True
        for char in chars:
            #print(char)
            if char == '{' or char == '[' or char == '(':
                stack.append(char)
            elif char == '}' or char == ']' or char == ')':
                if char == '}' and stack.pop() != '{':
                    valid = False
                    break
                elif char == ']' and stack.pop() != '[':
                    valid = False
                    break
                elif char == ')' and stack.pop() != '(':
                    valid = False
                    break

        if valid == True and len(stack) == 0:
            result.append('Yes')
        else:
            result.append('No')            

    print(result)

values = ['{}[]()', '{[}]}', '((12*2+{abc}))']
output = braces_valid(values)

def is_matched(expression):
    stack = []
    dict = {'(':')', '[':']', '{':'}'}
    for x in expression:
        if dict.get(x):
            #print("if", x, dict.get(x))
            # push in the matching closing symbol
            stack.append(dict[x])
        else:
            #print("else", x, stack[len(stack)-1])
            # if stack already empty 
            # or the last item in stack doesn't match the closing symbol, false
            if len(stack) == 0 or x != stack[len(stack)-1]:
                return False
            stack.pop()

    #print("length", len(stack))
    return len(stack) == 0

input = '{[()]}'
output = is_matched(input)
print(input, output)

input = '{[()]'
output = is_matched(input)
print(input, output)

# this should be valid if we consider throwing in non-braces/brackets/parens
input = '((12*2+{abc}))'
output = is_matched('((12*2+{abc}))')
print(input, output)
