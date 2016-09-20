## C bindings without writing C

```playground
@[Link(ldflags: "-lpq -L`pg_config --libdir`")]
lib LibPQ
  fun connect = PQconnectdb(conninfo : UInt8*) : Void*
  fun exec = PQexec(conn : Void*, query : UInt8*) : Void*
  fun getvalue = PQgetvalue(res : Void*, row : Int32, column : Int32) : UInt8*
end

conn = LibPQ.connect("postgres:///")
q = "select 'Hello it is ' || now()"
res = LibPQ.exec(conn, q)
p String.new(LibPQ.getvalue(res, 0, 0))
```

<small>
Source: https://github.com/will/crystal_workbook
</small>

Note:
TBD: non working sample
