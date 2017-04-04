### Lab 08-- Explaining the output data

#### The Function 
This is a function that loops throught the discrete-time logistic growth model function. 
The input for the function requires the initatal population size (initsize), the number of generations (generations),
the rate of growth (r), and the carring compastiatiy (K). The function has defaults of: 
initsize=10, generations=10, r=.02, K=1000

The end of the funcation ends with making a plot. This shows how abundance changes over time. 

The end of script ends with making a csv of the abundance data with the name of growthModel_init10_gen10_r.02_K1000.csv