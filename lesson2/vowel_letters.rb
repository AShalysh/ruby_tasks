array_alphabet = ('a'..'z').to_a
array_vowels = ["a", "e", "i", "o", "u"]
my_hash = {}

array_alphabet.each_with_index do |element, index|
  my_hash[element] = index + 1 if array_vowels.include?(element)
end

puts my_hash
