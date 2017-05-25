/*  ransom_note - hash table
    A kidnapper is using a magazine to make a ransom note. Determine if he can
    make the note with given words in the magazine.
    Input:
    magazine: give me one grand hurry today night night
    ransom: give one grand today hurry hurry

    Output:
    false (only one hurry in magazine)
 */

function ransom_note(magazine, ransom) {
    var wordFrequency = {};

    magazine.forEach(function(word, index) {
        wordFrequency[word] = (wordFrequency[word] || 0) + 1; 
    });
    console.log(wordFrequency);

    for (var i = 0; i < ransom.length; i++ ) {
        var word = ransom[i];
        if (wordFrequency[word] && wordFrequency[word] > 0) {
            wordFrequency[word]--;
        } else {
            return false;
        }
    }

    return true;
    
}

var magazine = "give me one grand hurry today night night".split(' ');
var ransom = "give one grand today hurry hurry".split(' ');
var response = ransom_note(magazine, ransom);
console.log(response);

// https://stackoverflow.com/questions/39522273/javascript-using-an-object-to-iterate-over-array-and-keep-track-of-item-frequen
