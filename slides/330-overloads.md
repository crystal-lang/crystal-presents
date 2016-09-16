## Overloads

```playground
class String
  def [](index : Int32)
    # return char at index
  end

  def [](range : Range)
    # return substring at range
  end
end

puts "hello"[0]
puts "hello"[1..-1]
```
