;; ref.cast1
;; Struct subtyping cast
(module
  (type $t0 (sub (struct)))
  (type $t1 (sub $t0 (struct (field i32))))
  (type $t2 (sub $t1 (struct (field i32 i32))))
  (type $t3 (sub $t0 (struct (field f64))))
  (type $t4 (sub $t3 (struct (field f64 f64))))
  (type $t5 (sub $t3 (struct (field f64 i32))))
  (type $func_rettype_s2 (func (result (ref $t2))))
  (type $func_rettype_s4 (func (result (ref $t4))))
  (type $main_type (func (result i32)))
  (func $struct_init2 (type $func_rettype_s2)
    (struct.new $t2
      (i32.const 5)
      (i32.const 4)
    )
  )
  (func $struct_init4 (type $func_rettype_s4)
    (struct.new $t4
      (f64.const 5.3)
      (f64.const 4.4)
    )
  )
  (func $main (type $main_type)
    (local $s2 (ref $t2))
    (local $s4 (ref $t4))
    (local.set $s2 (call $struct_init2))
    (local.set $s4 (call $struct_init4))
    (drop (ref.cast (ref $t5) (local.get $s4)))
    i32.const 42
  )
  (export "main" (func $main))
)
