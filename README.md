## Regression-Tools

R functions that implement two regression subset selection algorithms.

- ``fss.R``: Starts with the null model (no variables), and for the number of variables tests all submodels obtained by adding one variable from the unadded variables. For each submodel, chooses to add the variable that minimizes RSS, saves that submodel, and removes the added variable from the pool of variables to be added. Repeats this process until the full model is obtained, and chooses the submodel that minimizes BIC.

- ``bss.R``: Starts with the full model (all variables), and for the number of variables tests all submodels obtained by removing one variable. Removes the variable that minimizes RSS and saves the submodel. Repeats the process until the null model is reached and chooses the submodel that minimizes BIC.

![Alt text](https://raw.githubusercontent.com/l9leung/Regression-Tools/main/bss_screenshot.PNG)

### Examples
- ``demo.R``: Example usage on the ``Hitters`` data set from 'An Introduction to Statistical Learning with Applications in R'. ``Hitters`` contains Major League Baseball Data from the 1986 and 1987 seasons.

### References
- James, G., Witten, D., Hastie, T., and Tibshirani, R. (2013) An Introduction to Statistical Learning with applications in R, www.StatLearning.com, Springer-Verlag, New York