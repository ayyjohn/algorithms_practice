// implement the Array.prototype.map function in JavaScript (es6)

// a for loop should suffice, iterate from 0 to the length of the
// array - 1 and call the function on it

Array.prototype.myMap = function(callback) {
    let mapped = [];
    for (let i = 0; i < this.length; i++) {
        mapped.push(callback(this[i]));
    }
    return mapped;
};

console.log([1,2,3,4,5].myMap( (el) => Math.pow(el, 2)) );
console.log([].myMap( (el) => Math.pow(el, 2)) );
console.log([1,2,3,4,5].myMap( (el) => el));
