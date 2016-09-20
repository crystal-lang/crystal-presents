## Macros

```playground
macro attr_reader(name)
  def {{name}}
    @{{name}}
  end
end

class Person
  attr_reader age

  def initialize(@age : Int32)
  end
end

Person.new(18).age
```
