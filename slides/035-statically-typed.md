---
transition: slide-in fade-out
---

## Statically typed...?

```ruby
def shade_pixel(ray : Ray, obj : Sphere, tval : Float64) : Int32
  pi : Vector = ray.orig + ray.dir.scale(tval)
  color : Color = diffuse_shading(pi, obj, LIGHT1)
  col : Float64 = (color.r + color.g + color.b) / 3.0
  (col * 6.0).to_i
end
```

Note:
Explicar que cuando uno dice "estáticamente tipado" uno imagina muchas
anotaciones de tipo, pero que en realidad significa que el compilador
sabe el tipo de cada expresión en tiempo de compilación. Para eso se
puede usar inferencia de tipos. En Crystal queremos quitarle la carga
al programador de tener que poner tipos por todas partes. Queremos un
lenguaje que se sienta como Ruby pero que sea estáticamente tipado.
Pero... por qué queremos un lenguaje estáticamente tipado?
(TODO: buscar otro ejemplo más feo? :-P)
