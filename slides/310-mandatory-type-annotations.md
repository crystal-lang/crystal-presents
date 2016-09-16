## Mandatory type annotations

```playground
class Person
  def initialize(age : Int32)
    @age = age
  end

  def older_than?(age)
    @age >= age
  end
end
```

Note:

In the case of method arguments and local variables, their type don't need to be specified because these can be analized locally in each invocation.  However, one can specify their types, for example to better document the code and to get better error messages.

If you analize code in the wild you'll find that the number of methods is much bigger than the total number of instance vars, so these type annotations are not a big deal.
