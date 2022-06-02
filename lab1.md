## 1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.

mychar = "Hello world"  
mychar  

[1] "Hello world"  
class(mychar)  
[1] "character"  
 
mynum = 0.9
mynum
[1] 0.9
class(mynum)
[1] "numeric"
 
myint = 9L
myint
[1] 9
class(myint)
[1] "integer"
 
mycomplex = 9+9i
mycomplex
[1] 9+9i
class(mycomplex)
[1] "complex"
 
mylogic = T
mylogic
[1] TRUE
class(mylogic)
[1] "logical"
 
## 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 2.71, 0, 13; 100 значень TRUE.
 
myvec1 = c(5:75)
myvec1

[1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46
[43] 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
 
myvec2 = c(3.14, 2.71, 0, 13)
myvec2
[1]  3.14  2.71  0.00 13.00
 
myvec3 = c(1:100)
myvec3 = as.logical(myvec3)
myvec3

[1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[26] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[51] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[76] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 
## 3.Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind

m = c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1)
dim(m) = c(4, 3) 
m
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
 
cvec1 = c(0.5, 3.9, 0, 2)
cvec2 = c(1.3, 131, 2.2, 7)
cvec3 = c(3.5, 2.8, 4.6, 5.1)
m = cbind(cvec1, cvec2, cvec3)
m
     cvec1 cvec2 cvec3
[1,]   0.5   1.3   3.5
[2,]   3.9 131.0   2.8
[3,]   0.0   2.2   4.6
[4,]   2.0   7.0   5.1
 
## 4. Створити довільний список (list), в який включити всі базові типи.
l = list("Hello world", 0.9, 9L, 9+9i, T)
l
[[1]]
[1] "Hello world"

[[2]]
[1] 0.9

[[3]]
[1] 9

[[4]]
[1] 9+9i

[[5]]
[1] TRUE

 
## 5. Створити фактор з трьома рівнями «baby», «child», «adult».
f = factor(levels = c("baby", "child", "adult"))
f
factor(0)
Levels: baby child adult
 
## 6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. 
 
myvec6 = c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
 
 ind = 0L
 first_ind = 0L
 count = 0L
 while(ind != length(myvec6)) {
   if(anyNA(myvec6[ind]) && first_ind  0) {
     first_ind = ind
   } else if(anyNA(myvec6[ind])) {
     count = count + 1L
   }
   ind = ind+1L
 }
 first_ind
[1] 0

### Знайти кількість значень NA.
 count
[1] 3
 
## 7. Створити довільний data frame та вивести в консоль.
 table = data.frame(number = 1:9, logic= c(as.logical(1:9)))
 table
  number logic
1      1  TRUE
2      2  TRUE
3      3  TRUE
4      4  TRUE
5      5  TRUE
6      6  TRUE
7      7  TRUE
8      8  TRUE
9      9  TRUE

## 8. Змінити імена стовпців цього data frame.
 names(table) = c("Integer", "IsInteger")
 table
  Integer IsInteger
1       1      TRUE
2       2      TRUE
3       3      TRUE
4       4      TRUE
5       5      TRUE
6       6      TRUE
7       7      TRUE
8       8      TRUE
9       9      TRUE
