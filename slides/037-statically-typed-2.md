---
transition: fade-in slide-out
---

## Statically typed...?

```ruby
def shade_pixel(ray      , obj         , tval          )
  pi          = ray.orig + ray.dir.scale(tval)
  color         = diffuse_shading(pi, obj, LIGHT1)
  col           = (color.r + color.g + color.b) / 3.0
  (col * 6.0).to_i
end
```
