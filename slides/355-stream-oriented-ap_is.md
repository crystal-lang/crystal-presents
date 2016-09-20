## Stream-oriented APIs

```playground
class Point
  def initialize(@x : Int32, @y : Int32)
  end

  def to_s(io)
    io << "(" << @x << ", " << @y << ")"
  end
end
```

Note:

We are not ruby compatible.
