// Call this 'seed' because we need an initial state with something interesting
var seed = [
	[0,0,1,0,0,0,0,0,0],
	[0,0,0,1,0,0,0,0,0],
	[0,1,1,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0]
];

var seed1 = [
	[0,0,0,0,0,0,0,0,0],
	[0,1,0,1,0,0,0,0,0],
	[0,0,1,1,0,0,0,0,0],
	[0,0,1,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0]
];

var expected = [
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,1,0,0,0],
	[0,0,0,1,0,1,0,0,0],
	[0,0,0,0,1,1,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0]
];

// Each tick applies the four rules of the game to every cell on the board
// simultaneously, producing the next state
function tick(state) {
  // Part 1
    var newState = [];
    state.forEach((row, idx) => {

        let subArr = [];
        row.forEach((col, idx2) => {
            let el = state[idx][idx2];

            let neighborCount = livingNeighbors(idx, idx2, state);

            if (el === 0 && neighborCount === 3) {
                subArr.push(1);
            } else if (el === 1) {
                if (neighborCount === 2 || neighborCount === 3) {
                    subArr.push(1);
               } else {
                    subArr.push(0);
               }
            } else {
                subArr.push(0);
            }

         });
        newState.push(subArr);
    });

    return newState;
}


// Each cell has eight neighbors, namely the eight cells that touch it
function livingNeighbors(x, y, state) {
  var count = 0;

     // look at eight cells
       //    [
          //     [ x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
          //     [ x, y - 1], [x + 0, y + 0], [x + 0 , y + 1],
          //     [ x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
       //     ]


        for (let rIndex = -1; rIndex < 2; rIndex++) {
            for (let cIndex = -1; cIndex < 2; cIndex++) {

                if (x + rIndex < 0 || y + cIndex < 0) {
                    continue;
                }
                if (x + rIndex >= state.length || y + cIndex >= state.length) {
                    continue;
                }
                if (x + rIndex === x && y + cIndex === y) {
                    continue;
                }

                count += state[x + rIndex][y + cIndex];
            }
        }

  // Part 2
  return count;
}

function gameOfLife(seedState) {
	var state = seedState;
	for(var i = 1; i <= 10; i++) {
		state = tick(state);

	}
	console.log("Yours:\n\n", state, "\n\nExpected:\n\n", expected);
}

gameOfLife(seed);
