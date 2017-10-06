#Question: A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.

# Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.

=begin Questions:
0. Do you have a sample input/output you can provide?
1. Are the strings case sensitive?
2. Are we allowed to take substrings from whole words and concat them to make ransom note?
3. Can we assume the strings only contain English alphabetical letters?
=end

# Step 1: Store words in magazine in a separate counter hash table. Then deduct the hash count in the counter hash table by iterating through ransom note and seeing if the words are in the counter hash table.

def ransom_note(magazine, ransom)
  counter = Hash.new(0)

  magazine.each { |word| counter[word] += 1 }
  ransom.each { |word| counter[word] -= 1 }
  counter.values.each do |el|
    return print("No") if el < 0
  end
  print("Yes")
end

magazine3 = "geyx rdyd mo j hpys ar r cgcvo mlzbl oe kgi vaf wdi t iuqx jachs hhky sqljh za u xbv v ghwe pac ep owmhz f ivx o pff dnmyf nbjsi meuhu da tq uprj zn tdnzk wcxpn pzb vcl xa xkpka xfw opw acgfq e ey uda uybt vaf f owmhz tdnzk mo vaf mo meuhu mlzbl r pac ghwe za da uybt rdyd f xkpka nbjsi xfw geyx mo hhky jto hhky pac meuhu owmhz xa ar et ghwe ghwe u wdi sqljh o ar cgcvo xbv xa wdi mo hpys nbjsi pff e
za ivx sqljh o rdyd v mlzbl meuhu xkpka mo nbjsi nbjsi ivx da vcl dnmyf vcl ivx rdyd t uprj ghwe ivx kgi e xa pac xbv rdyd vcl u mlzbl uda hpys ar t kgi opw oe mlzbl pff oe r wdi iuqx hpys uda kgi kgi da owmhz xa hpys ey ghwe pac dnmyf meuhu wcxpn xkpka tq u opw jachs rdyd sqljh meuhu ivx fj tq hpys ey geyx xa ghwe f ivx u wcxpn o hhky vcl oe vaf rj zn vaf f pff jachs mo uda uybt vcl ey acgfq jachs vaf".split(" ").slice(0, 100)

ransom3 = "geyx rdyd mo j hpys ar r cgcvo mlzbl oe kgi vaf wdi t iuqx jachs hhky sqljh za u xbv v ghwe pac ep owmhz f ivx o pff dnmyf nbjsi meuhu da tq uprj zn tdnzk wcxpn pzb vcl xa xkpka xfw opw acgfq e ey uda uybt vaf f owmhz tdnzk mo vaf mo meuhu mlzbl r pac ghwe za da uybt rdyd f xkpka nbjsi xfw geyx mo hhky jto hhky pac meuhu owmhz xa ar et ghwe ghwe u wdi sqljh o ar cgcvo xbv xa wdi mo hpys nbjsi pff e
za ivx sqljh o rdyd v mlzbl meuhu xkpka mo nbjsi nbjsi ivx da vcl dnmyf vcl ivx rdyd t uprj ghwe ivx kgi e xa pac xbv rdyd vcl u mlzbl uda hpys ar t kgi opw oe mlzbl pff oe r wdi iuqx hpys uda kgi kgi da owmhz xa hpys ey ghwe pac dnmyf meuhu wcxpn xkpka tq u opw jachs rdyd sqljh meuhu ivx fj tq hpys ey geyx xa ghwe f ivx u wcxpn o hhky vcl oe vaf rj zn vaf f pff jachs mo uda uybt vcl ey acgfq jachs vaf".split(" ").slice(100, 100)

magazine = "give me one grand today night".split(" ")
ransom = "give one grand today".split(" ")

magazine1 = "two times three is not four".split(" ")
ransom1 = "two times two is four".split(" ")

puts ransom_note(magazine, ransom) #=> Yes
puts ransom_note(magazine1, ransom1) #=> No
puts ransom_note(magazine3, ransom3) #=> No
