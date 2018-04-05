array_alphabet = ('a'..'z').to_a
#array_alphabet = [*('a'..'z')]
array_vowels = ["a", "e", "i", "o", "u"]
my_hash = {}

array_alphabet.each_with_index do |element,index|
  if array_vowels.include?(element)
    my_hash[element] = index + 1
  end
end

puts my_hash
