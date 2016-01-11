def method1(a)
  method2(a)
end

def method2(a)
  method3(a)
end

def method3(a)
  puts a
end
b=2
method1(b)
