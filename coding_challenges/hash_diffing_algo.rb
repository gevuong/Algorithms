# Suppose we expect the result of some calculation to be a specific key-value structure, such as:
#
# ```
# expected = {
#     id: 9876
#     first_name: 'Matt'
#     last_name: 'Murdock'
#     account: {
#        bank_name: 'Bank Of America'
#        account_number: 12345
#     }
# }
# ```
#
# But the actual result of the calculation was:
#
# ```
# actual = {
#     id: 20
#     first_name: 'Matt'
#     account: {
#        account_number: 12345
#        balance: 500
#     }
# }
# ```
#
# The goal is to compare the two structures in our tests and identify the
# specific differences between them. Write a helper function(s), which is given two inputs (actual and expected), and outputs a list of all the diffs between them, using the following github-like format:
#
# ```
# [
# [ '-', 'id',                  9876              ],
# [ '-', 'last_name',           'Murdock'         ],
# [ '-', 'account.bank_name',   'Bank Of America' ],
# [ '+', 'id',                  20                ],
# [ '+', 'account.balance',     500               ]
# ]
#
# The '-' symbol denotes the key-value that is missing from the actual data structure
# but does not exist in the expected data structure.
# The '+' symbol denotes the key-value that exists in the actual data structure
# but does not exist in the expected data structure.
#
# This script contains tests that will verify the results of your implementation
# given specific test inputs.
# Run the tests using the command `npm test` in the command line interface.
# */
#
# import test from 'ava';
# import _ from 'lodash';
#
# /*** IMPLEMENT YOUR CODE HERE: ***/
#
def diff(actual, expected)
  arr = []
  actual.keys.each do |key|
    # expected_val = {}
    if expected[key].is_a?(Hash)
      hash = diff(actual[key], expected[key])
    elsif expected[key].nil?
      arr.push(['-', key, actual[key]])
    end
  end

  arr
end

actual = {
   "apples" => 3,
   "oranges" => 4
};

expected = {
    "apples" => 3,
    "grapes" => 5
};

p diff(actual, expected)

# solution = [
#     ['-', 'grapes', 5],
#     ['+', 'oranges', 4]
# ];

actual = {
    apples: 3,
    oranges: {
        navel: 5
    }
};

expected = {
    apples: 3,
    oranges: {
        valencia: 4
    }
};

p diff(actual, expected)

solution = [
    ['-', 'oranges.valencia', 4],
    ['+', 'oranges.navel', 5]
];


#
# /*** END OF YOUR IMPLEMENTATION ***/
#
# /*** TESTS: ***/
# let actual, expected, result, solution;
#
# function arrayMembersEqual(result, solution) {
#     let allMembersEqual = true;
#
#     for(let i = 0; i < solution.length; i++) {
#         let found = false;
#         let solutionDiff = solution[i];
#
#         for(let j = 0; j < result.length; j++) {
#             let resultDiff = result[j];
#             if(_.difference(resultDiff, solutionDiff).length === 0) {
#                 found = true;
#             }
#         }
#
#         if(found === false) {
#             allMembersEqual = false;
#             break;
#         }
#     }
#
#     return allMembersEqual;
# }
#
# test('calculates the correct shallow diff', t => {
#     actual = {
#         apples: 3,
#         oranges: 4
#     };
#
#     expected = {
#         apples: 3,
#         grapes: 5
#     };
#
#     solution = [
#         ['-', 'grapes', 5],
#         ['+', 'oranges', 4]
#     ];
#
#     result = diff(actual, expected);
#
#     t.true(result.length === 2);
#     t.true(arrayMembersEqual(result, solution));
# });





# test('calculates the correct nested diff', t => {
#     actual = {
#         apples: 3,
#         oranges: {
#             navel: 5
#         }
#     };
#
#     expected = {
#         apples: 3,
#         oranges: {
#             valencia: 4
#         }
#     };
#
#     solution = [
#         ['-', 'oranges.valencia', 4],
#         ['+', 'oranges.navel', 5]
#     ];
#
#     result = diff(actual, expected);
#
#     t.true(result.length === 2);
#     t.true(arrayMembersEqual(result, solution));
# });
#
# test('calculates the correct double nested diff', t => {
#     actual = {
#         apples: 3,
#         oranges: {
#             bergamot: 3,
#             navel: {
#                 peaches: 1,
#                 apples: 3
#             }
#         }
#     };
#
#     expected = {
#         apples: 3,
#         oranges: {
#             bergamot: 3,
#             valencia: {
#                 pears: 2,
#                 oranges: 4
#             }
#         }
#     };
#
#     solution = [
#         ['+', 'oranges.navel.peaches', 1],
#         ['+', 'oranges.navel.apples', 3],
#         ['-', 'oranges.valencia.pears', 2],
#         ['-', 'oranges.valencia.oranges', 4]
#     ];
#
#     result = diff(actual, expected);
#
#     t.true(result.length === 4);
#     t.true(arrayMembersEqual(result, solution));
# });
#
# test('comparing nested object to value', t => {
#     actual = {
#         apples: 3,
#         oranges: 5
#     };
#
#     expected = {
#         apples: 3,
#         oranges: {
#             bergamot: 3,
#             valencia: {
#                 pears: 2,
#                 oranges: 4
#             }
#         }
#     };
#
#     solution = [
#         ['-', 'oranges.valencia.pears', 2],
#         ['-', 'oranges.valencia.oranges', 4],
#         ['-', 'oranges.bergamot', 3],
#         ['+', 'oranges', 5]
#     ];
#
#     result = diff(actual, expected);
#
#     t.true(result.length === 4);
#     t.true(arrayMembersEqual(result, solution));
# });
