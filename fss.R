fss = function(x, y, plot = TRUE){
  #Forward Stepwise Selection Algorithm, returns BIC minimizing model and plots BIC from all submodels.
  
  y = unlist(y, use.names = FALSE)
  p = dim(x)[2]
  n = dim(x)[1]
  BIC = numeric(length = dim(x)[2])
  BIC_models = list(length = dim(x)[2])
  
  #Full model
  model = lm(y~., data = cbind(y, x))
  BIC[p] = n*log((sum(resid(model)^2))/n) + log(n)*(p)
  suppressWarnings(BIC_models[p] <- model)
  
  #Obtain p submodels
  for(i in 1:(p - 1)){
    RSS = numeric(length = dim(x)[2])
    RSS_models = list(length = dim(x)[2])
    #Test models obtained by adding one additional variable
    for(j in 1:dim(x)[2]){
      X = cbind(y, x[, j])
      model = lm(y~., data = data.frame(X))
      RSS[j] = sum(resid(lm(y~., data = data.frame(X)))^2)
      suppressWarnings(RSS_models[j] <- model)
    }
    min = which.min(RSS)
    y = cbind(y, x[, min])
    colnames(y)[i + 1] = colnames(x)[min]
    x = x[, -min]
    model = lm(y~., data = data.frame(y))
    BIC[i] = n*log((sum(resid(model)^2))/n) + log(n)*(i)
    suppressWarnings(BIC_models[i] <- model)
  }
  
  if(plot == TRUE){
    plot(BIC, xlab = "Number of Variables", col = "blue", cex = 1.5) 
    lines(BIC, lwd = 2)
    abline(v = which.min(BIC), col = "red", lty = "dashed", lwd = 2)
  }
  
  return(BIC_models[which.min(BIC)])
}
