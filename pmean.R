set_file_index = function(id) {
  index = id/1000
  index = as.character(index)
  index = paste(index, "00", sep="")
  index = substr(index, 3, 5)
  index
}

vecnmean = function(x) {
  count = 0
  sum = 0
  for (var in x) {
    if(!anyNA(var)) {
      sum = sum + var
      count = count + 1 
    }
  }
  mean = sum / count
  mean
}

pmean = function(directory, pollutant, id=1:332) {
  setwd(directory)
  vec = vector("numeric")
  sum = 0
  for(var in id) {
    filename = paste(set_file_index(var), ".csv", sep="")
    file = read.csv(filename)
    vec = append(vec, file[[pollutant]])
  }
  mean = vecnmean(vec)
  mean
}

num_of_comp = function(f) {
  i = 1
  count = 0
  while(i < nrow(f)) {
    if(!anyNA(f$sulfate[i]) && !anyNA(f$nitrate[i])) {
    count=count+1
    }
    i = i+1
  }
  count 
}


complete = function(directory, id){
  setwd(directory)
  vec = vector("numeric")
  
  for(var in id) {
    filename = paste(set_file_index(var), ".csv", sep="")
    file = read.csv(filename)
    vec = append(vec, num_of_comp(file))
  }
  f = data.frame(id=id, nobs=vec)
  f
}

mark_comp_corr = function(f) {
  i = 1
  vec = vector("logical", nrow(f))
  
  while(i < nrow(f)) {
    if(!anyNA(f$sulfate[i]) && !anyNA(f$nitrate[i])) {
      vec[i] = T
    }
    i = i+1
  }
  f = append(f, data.frame(complete = vec))
}

corr = function(directory, threshold=0) {
  id = c(1:322)
  vec = vector("numeric")
  
  for(var in id) {
    filename = paste(set_file_index(var), ".csv", sep="")
    file = read.csv(filename)
    coun = 0
    if(num_of_comp(file) > threshold) {
      i = 1
      file = mark_comp_corr(file)
      sulf = file$sulfate[file$complete]
      nitr = file$nitrate[file$complete]
      vec = append(vec, cor(sulf, nitr))
      count = count + 1
    }
  }
  if(count == 0)
    vec = append(vec, 0)
  vec
}


