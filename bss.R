bss = function(x, y, plot = TRUE){
  #Backward Stepwise Selection algorithm, returns BIC minimizing model and plots BIC from all submodels.
  
  y = unlist(y, use.names = FALSE)
  p = dim(x)[2]
  n = dim(x)[1]
  BIC = numeric(length = dim(x)[2])
  BIC_models = list(length = dim(x)[2])
  
  #Full model
  model = lm(y~., data = cbind(y, x))
  BIC[1] = n*log((sum(resid(model)^2))/n) + log(n)*(p)
  suppressWarnings(BIC_models[1] <- model)
  
  #Obtain p - 1 sub models
  for(i in 2:p){
    RSS = numeric(length = dim(x)[2])
    RSS_models = list(length = dim(x)[2])
    #Test models obtained by removing one additional variable
    for(j in 1:dim(x)[2]){
      X = cbind(y, x[, -j])
      model = lm(y~., data = data.frame(X))
      RSS[j] = sum(resid(lm(y~., data = data.frame(X)))^2)
      suppressWarnings(RSS_models[j] <- model)
    }
    min = which.min(RSS)
    x = x[, -min]
    model = lm(y~., data = data.frame(cbind(y, x)))
    BIC[i] = n*log((sum(resid(model)^2))/n) + log(n)*(p - i)
    suppressWarnings(BIC_models[i] <- model)
  }
  
  if(plot == TRUE){
    plot(c(0:(p - 1)), BIC, xlab = "Number of Removed Variables", col = "blue", cex = 1.5)
    lines(c(0:(p - 1)), BIC, lwd = 2)
    abline(v = which.min(BIC) - 1, col = "red", lty = "dashed", lwd = 2)
  }
  min = which.min(BIC)
  return(BIC_models[min])
}
