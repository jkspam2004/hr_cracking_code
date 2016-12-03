'''
    Braces/Parens Valid
    Given a string of brackets/braces/parens, determine if they are valid (matching open and closing pairs)
    cleaned up by Varian
'''

def parensValidTest(values):
    for expression in values:
        print("parens_valid1('" + expression + "')=" + str(parens_valid1(expression)))
        print("parens_valid2('" + expression + "')=" + str(parens_valid2(expression)))

def parens_valid1(expression):
    stack = []
    dict = {'(':')', '[':']', '{':'}'}
    for x in expression:
        if dict.get(x):
            # push in the matching closing symbol to the stack
            stack.append(dict[x])
        else:
            # if stack already empty
            # or the last item in stack doesn't match the closing symbol, false
            if len(stack) == 0 or x != stack[len(stack)-1]:
                return False
            stack.pop()
    return len(stack) == 0

def parens_valid2(expression):
    stack = []
    for char in expression:
        #print(char)
        if char == '{' or char == '[' or char == '(':
            stack.append(char)
        elif char == '}' or char == ']' or char == ')':
            if len(stack) <= 0:
                return False
            popped = stack.pop()
            #print(popped)

            if char == '}' and popped != '{':
                return False
            elif char == ']' and popped != '[':
                return False
            elif char == ')' and popped != '(':
                return False
    return len(stack) == 0

values = ['{}[]()', '{[}]}', '[[[]', '()))']
parensValidTest(values)
