/*
    left_rotation:
    Given an array of integers and a number, perform left rotations on the array.
    Then print the updated array as a single line of space-separated integers.

    input: 
    5 4
    1 2 3 4 5

    output:
    5 1 2 3 4
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

function main() {
    var n_temp = readLine().split(' '); // read the first line from input
    var n = parseInt(n_temp[0]);
    var k = parseInt(n_temp[1]);
    a = readLine().split(' '); // read the second line of input
    a = a.map(Number);
    
    function rotate_left_array(a, n, k) {
        var k = -k; // shifting left is a negative offset

        // make offset positive to work with
        // i.e. shifting left 4 is equivalent to shift right 1 for a 5 element array
        while (k < 0) { 
            k += n;
        }
        
        newarr = [];
        for (var i=0; i<n; i++) {
            // when adding offset to current index, will shift off the end of array
            if (i >= n-k) { 
                newarr[i - (n-k)] = a[i];
            } else {
                newarr[i+k] = a[i];
            }
        }
        return newarr;
    }
    
    newarr = rotate_left_array(a, n, k);
    var newstring = newarr.join(' ')
    
    console.log(newstring);

}
