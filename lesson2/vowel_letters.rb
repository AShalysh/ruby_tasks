array_alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
array_vowels = ["a", "e", "i", "o", "u"]
array_new = Array.new
my_hash = Hash.new

array_alphabet.each_with_index do |element,index|
  if array_vowels.include?(element)
    array_new << element
    array_new << index + 1
  end
end

my_hash = Hash[*array_new]

puts my_hash
