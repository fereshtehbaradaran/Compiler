# Compiler
A compiler which converts an special form of mathematical expressions to three-address-code.

Each expression contains Integers, variables, parentheses, white spaces and operations which are defined as follow:
+ **:A:** (Addition)  
+ **:S:** (Subtraction)  
+ **:M:** (Multiplication)  
+ **:D:** (Division)  

The order of operations are as usuall, but calculated from right to left.

### Sample Input:
```
x = 3 :D: 4:S: 12
```

### Sample Output:
```
t1 = 4/3;
t2 = 12-t1;
x = t2;
```




## Requierments
You need to have Flex and Bison installed 

### Ubuntu
```
$ sudo apt-get update
$ sudo apt-get install flex
$ sudo apt-get install bison 
```

## Run
```
$ bison -d  parser.y
$ flex lex.l
$ gcc lex.yy.c parser.tab.c -o compiler
$ ./compiler < ./samples/input/input1.txt | cat > ./samples/output/output1.txt
```
