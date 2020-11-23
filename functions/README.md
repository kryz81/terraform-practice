## Functions

**Remove empty characters at the end of string**

```
chomp("test\r\n")
```

**Add given number of spaces at the beginning**

```
indent(5, "Hello")
```

**Create string from array**

```
join(",", ["a", "b", "c"])
```

**Read content of a file**

```
file("myfile.txt")
```

**Check is an expression does not return error**

```
can(file("non-existing-file")) // returns false
```

**Try to run function, if errors return fallback value**

```
try(file("non-existing-file"), "--no content--")
```

**Get host address based on given CIDR and host number**

```
cidrhost("10.0.0.0/16", 500)
```

**Get timestamp**

```
timestamp()
```

**Format date**

```
formatdate("DD.MM.YYYY HH:mm", timestamp())
```

**Remove empty strings from array of strings**

```
compact(["a", "", "b", ""])
```

**Remove duplicates from a list**

```
distinct([1, 2, 3, 1, 2, 3, 4])
```

**Get element with given index from a list**

```
element(["one", "two"], 1)
```

**Get index of given element in list**

```
index(["a", "b", "c"], "b")
```
