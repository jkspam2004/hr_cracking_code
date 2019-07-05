/*
    Strings: Making Anagrams

    Given two strings, a and b, that may or may not be of the same length, 
    determine the minimum number of character deletions required to make a and b
    anagrams.  Any characters can be deleted from the either of the strings

    Anagram: Two strings can be rearranged to match each other; both strings
    must contain the same exact letters with the same exact frequency.

    Input: two strings
    Output: total number of deletions for both strings to become anagrams
*/

process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();    
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

/* O(n) to walk through both strings
   We need 3 objects to store the characters of string, but still O(n) for memory space
   Loop through characters of both strings.
   Store character in 3 objects: appears in first string, appears in second string, appears in either string 
   Compare count of occurences between both strings, subtracting out the difference as the number of deletions to create anagram.
*/
function main() {
    var a = readLine();
    var b = readLine();

    function make_anagrams (first_str, second_str) {
        var first_arr = first_str.split('')
        var second_arr = second_str.split('')

        var all_hash = {};
        var first_hash = {};
        // store the characters of first string as the key in a hash object
        // with count of occurences as the value
        // also store the characters in a hash that will contain all possible chars from the first and second strings
        for (var i = 0; i < first_arr.length; i++) {
            if (first_hash[first_arr[i]]) {
                first_hash[first_arr[i]]++;
                all_hash[first_arr[i]]++;
            } else { // if the key doesn't exist, initiate count to 1 for key
                first_hash[first_arr[i]] = 1;
                all_hash[first_arr[i]] = 1;
            }
        }

        var second_hash = {};
        // store the characters of second string as the key in hash object 
        // with count of occurences as the value
        for (var i = 0; i < second_arr.length; i++) {
            if (!(second_arr[i] in second_hash)) { // initiate count to 1 if key does not exist
                second_hash[second_arr[i]] = 1;

                // set the count for all_hash appropriately depending if key already exists from looking at first_hash
                all_hash[second_arr[i]] = (second_arr[i] in all_hash) ? all_hash[second_arr[i]]+1 : 1; 
            } else {
                second_hash[second_arr[i]]++;
                all_hash[second_arr[i]]++;
            }

            
        }

        // go through all the characters
        var deletions = 0; // number of deletion operations to make strings anagrams
        for (var letter in all_hash) {
            if (letter in first_hash && letter in second_hash) { 
                // character in both strings, subtract to get extra count
                deletions += Math.abs(first_hash[letter] - second_hash[letter]);
            } else if (letter in first_hash) {
                // character only in the first string
                deletions += first_hash[letter]
            } else if (letter in second_hash) {
                // character only in the second string
                deletions += second_hash[letter];
            }
        }

        console.log("deletions", deletions);
    }

    make_anagrams(a, b);
}
