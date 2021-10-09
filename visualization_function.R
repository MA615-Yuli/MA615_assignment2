vf<-function(input,xv,yv,cv){
  ## this fuction is used as plot boxplot
  ## input:tibble 
  ## xv: aes x variable
  ## yv: aes y variable
  ## cv: color group
  p<-ggplot(input)+geom_boxplot(aes(x=xv,y=yv,color=cv),outlier.shape = NA)+
    labs(y='co2_emissions_tonnes_per_person')+
    scale_colour_discrete(name=NULL)+theme_bw()
  ## there is no  outliers, no legend title name
  return(p)
}







