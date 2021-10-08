vf<-function(input,xv,yv,cv){
  p<-ggplot(input)+geom_boxplot(aes(x=xv,y=yv,color=cv),outlier.shape = NA)+
    labs(y='co2_emissions_tonnes_per_person')+
    scale_colour_discrete(name=NULL)+theme_bw()
  return(p)
}







