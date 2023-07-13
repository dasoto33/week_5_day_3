# In this exercise, your goal is to write a function which will reverse the vowels in a string. 
# Any characters which are not vowels should remain in their original position. Here are some examples:

# "Hello!" => "Holle!"
# "Tomatoes" => "Temotaos"
# "Reverse Vowels In A String" => "RivArsI Vewols en e Streng"
# For simplicity, you can treat the letter y as a consonant, not a vowel.

# create list for characters
# vowels = aeiou
# make while loop to index vowel in word
# if left char is vowel, reverse
# if left char is not vowel
# if char is not vowel

def vowel_reverse(string):
    vowels = 'aeiouAEIOU'
    alist = list(string)
    left = 0
    right = len(string) - 1 

    while left <= right: #O(n)
        if alist[left] in vowels and alist[right] in vowels:
            alist[left], alist[right] = alist[right], alist[left]
            left += 1
            right -= 1
        elif alist[left] in vowels: #O(n)
            right -= 1
        elif alist[right] in vowels: #O(n)
            left += 1
        else:
            left += 1
            right -= 1
    return ''.join(alist)



print(vowel_reverse("Reverse Vowels In A String"))
print(vowel_reverse("Tomatoes"))
print(vowel_reverse("Hello"))
print(vowel_reverse("That was a struggle"))

# Solution 2:

# def reverse_vowels(s):
#     pattern = '[aeiouAEIOU]'
#     result = re.sub(pattern, lambda match: match.group(0)[::-1], s)
#     return result

# Solution 3:

# def rev_vowels(input_string):
#     vowels = {'a','e','i','o','u'}
#     input_string = list(input_string)
#     left,right = 0, len(input_string) - 1
#     while left < right:
#         if input_string[left].lower() in vowels and input_string[right].lower() in vowels:
#             input_string[left],input_string[right] = input_string[right],input_string[left]
#             left += 1
#             right -= 1
#         if input_string[left].lower() not in vowels:
#             left += 1
#         if input_string[right].lower() not in vowels:
#             right -= 1
#     return ''.join(input_string)