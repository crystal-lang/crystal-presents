## Macros

```playground
macro getter(name)
  def {{name}}
    @{{name}}
  end
end

class Person
  getter age

  def initialize(@age : Int32)
  end
end

Person.new(18).age # => 18
```
