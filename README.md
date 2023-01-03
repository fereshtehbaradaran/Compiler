# Compiler
A compiler which converts an special form of mathematical expressions to three-address-code

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
