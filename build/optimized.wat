(module
 (type $f64_=>_f64 (func (param f64) (result f64)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (import "env" "memory" (memory $0 0))
 (import "Math" "log" (func $~lib/bindings/Math/log (param f64) (result f64)))
 (import "Math" "log2" (func $~lib/bindings/Math/log2 (param f64) (result f64)))
 (export "update" (func $assembly/mandelbrot/update))
 (export "memory" (memory $0))
 (func $assembly/mandelbrot/update (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  local.get $1
  f64.convert_i32_u
  f64.const 0.5
  f64.mul
  local.set $14
  local.get $0
  f64.convert_i32_u
  f64.const 0.625
  f64.mul
  f64.const 10
  local.get $0
  i32.const 3
  i32.mul
  local.tee $9
  local.get $1
  i32.const 2
  i32.shl
  local.tee $10
  local.get $9
  local.get $10
  i32.lt_s
  select
  f64.convert_i32_s
  f64.div
  local.tee $11
  f64.mul
  local.set $15
  f64.const 1
  local.get $2
  f64.convert_i32_u
  f64.div
  local.set $16
  i32.const 8
  local.get $2
  local.get $2
  i32.const 8
  i32.gt_u
  select
  local.set $9
  loop $for-loop|0
   local.get $1
   local.get $7
   i32.gt_u
   if
    local.get $7
    f64.convert_i32_u
    local.get $14
    f64.sub
    local.get $11
    f64.mul
    local.set $12
    local.get $0
    local.get $7
    i32.mul
    i32.const 1
    i32.shl
    local.set $10
    i32.const 0
    local.set $8
    loop $for-loop|1
     local.get $0
     local.get $8
     i32.gt_u
     if
      local.get $8
      f64.convert_i32_u
      local.get $11
      f64.mul
      local.get $15
      f64.sub
      local.set $13
      f64.const 0
      local.set $3
      f64.const 0
      local.set $5
      i32.const 0
      local.set $6
      loop $while-continue|2
       local.get $3
       local.get $3
       f64.mul
       local.tee $17
       local.get $5
       local.get $5
       f64.mul
       local.tee $4
       f64.add
       f64.const 4
       f64.le
       if
        block $while-break|2
         local.get $3
         local.get $3
         f64.add
         local.get $5
         f64.mul
         local.get $12
         f64.add
         local.set $5
         local.get $17
         local.get $4
         f64.sub
         local.get $13
         f64.add
         local.set $3
         local.get $2
         local.get $6
         i32.le_u
         br_if $while-break|2
         local.get $6
         i32.const 1
         i32.add
         local.set $6
         br $while-continue|2
        end
       end
      end
      loop $while-continue|3
       local.get $6
       local.get $9
       i32.lt_u
       if
        local.get $3
        local.get $3
        f64.mul
        local.get $5
        local.get $5
        f64.mul
        f64.sub
        local.get $13
        f64.add
        local.get $3
        local.get $3
        f64.add
        local.get $5
        f64.mul
        local.get $12
        f64.add
        local.set $5
        local.set $3
        local.get $6
        i32.const 1
        i32.add
        local.set $6
        br $while-continue|3
       end
      end
      local.get $10
      local.get $8
      i32.const 1
      i32.shl
      i32.add
      local.get $3
      local.get $3
      f64.mul
      local.get $5
      local.get $5
      f64.mul
      f64.add
      local.tee $4
      f64.const 1
      f64.gt
      if (result i32)
       local.get $6
       i32.const 1
       i32.add
       f64.convert_i32_u
       local.get $4
       call $~lib/bindings/Math/log
       f64.const 0.5
       f64.mul
       call $~lib/bindings/Math/log2
       f64.sub
       local.get $16
       f64.mul
       f64.const 0
       f64.max
       f64.const 1
       f64.min
       f64.const 2047
       f64.mul
       i32.trunc_f64_u
      else
       i32.const 2047
      end
      i32.store16
      local.get $8
      i32.const 1
      i32.add
      local.set $8
      br $for-loop|1
     end
    end
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $for-loop|0
   end
  end
 )
)
