## Statically typed...?

```ruby
def greet(someone : String, greeting : String)
  result : String = "#{greeting} #{someone}!"
  puts result
end

someone : String = "world"
greeting : String = "Hello"
greet(someone, greeting)
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
