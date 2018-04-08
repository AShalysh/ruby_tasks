array_alphabet = ('a'..'z').to_a
array_vowels = ["a", "e", "i", "o", "u"]
my_hash = {}

array_alphabet.each.with_index(1) do |element, index|
  my_hash[element] = index if array_vowels.include?(element)
end

puts my_hash
