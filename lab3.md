## 1. Функція add2(x, y), яка повертає суму двох чисел.
```
 add2 = function(x, y) {
   x+y
 }
 ```
 `print(add2(9, 1))`  
[1] 10
 
## 2.Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.
 ```
 above = function(x, n=10) {
   vec = vector("numeric")
   print(x)
   for (var in x) {
     if(var  n)
       vec = append(vec, var)
   }
   print(vec)
   vec
 }
 ```
 `v = above(c(1:20))`  
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20  
 [1] 11 12 13 14 15 16 17 18 19 20  
 
## 3. Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “<”, “”, “<=”, “=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.
```
 my_ifelse = function(x, exp, n){
   vec = vector("numeric")
   if(exp == "<") {
     for (var in x) {
       if(var < n)
         vec = append(vec, var)
     }
     vec
   }else if(exp == "") {
     for (var in x) {
       if(var  n)
         vec = append(vec, var)
     }
     vec
   }else if(exp == "<=") {
     for (var in x) {
       if(var <= n)
         vec = append(vec, var)
     }
     vec
   }else if(exp == "=") {
     for (var in x) {
       if(var = n)
         vec = append(vec, var)
     }
     vec
   }else if(exp == "==") {
     for (var in x) {
       if(var == n)
         vec = append(vec, var)
     }
     vec
   }else
     x
 } 
 ```
 `print(my_ifelse(c(1:10), "<",2))`  
[1] 1  
 `print(my_ifelse(c(1:10), "",2))`  
[1]  3  4  5  6  7  8  9 10  
 `print(my_ifelse(c(1:10), "<=",2))`  
[1] 1 2  
 `print(my_ifelse(c(1:10), "=",2))`  
[1]  2  3  4  5  6  7  8  9 10  
 `print(my_ifelse(c(1:10), "==",2))`  
[1] 2  
 `print(my_ifelse(c(1:10), "=",2))`  
 [1]  1  2  3  4  5  6  7  8  9 10  
 
## 4. Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.
```
 columnmean = function(x, removeNA = T) {
   mean = vector("numeric")
   i = 1
   while(i <= ncol(x)) {
     count = 0
     sum = 0
     j = 1
     while(j <= nrow(x)) {
       if(removeNA && !anyNA(x[j, i])) {
         sum = sum + x[j, i]
         count = count + 1
       }else if(!removeNA){
         sum = sum + x[j, i]
         count = count + 1
       }
       j = j+1
     }
     mean = append(mean, sum/count)
     i = i+1
   }
   mean
 }
 ```
 `m = c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1)`  
 `dim(m) = c(4, 3)`   
 `v = columnmean(m)`  
 `v`  
[1]  1.600 35.375  4.000  
 `y <- data.frame(a = rnorm(100), b = 1:100)`  
 `v = columnmean(y)`  
 `v`  
[1]  0.0654383 50.5000000  
 `m = c(0.5, 3.9, 0, 2, NA, 131, 2.2, 7, NA, 2.8, NA, 5.1)`  
 `dim(m) = c(4, 3)`  
 `v = columnmean(m)`  
 `v`  
[1]  1.60000 46.73333  3.95000  
 `v = columnmean(m, F)`  
 `v`  
[1] 1.6  NA  NA  
