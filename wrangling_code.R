library(readr)
get_data<-function(){
  ddf_entities_geo_country <- read_csv("data/ddf--entities--geo--country.csv") #read file
  ddf_entities_geo_world_6region <- read_csv("data/ddf--entities--geo--world_6region.csv") #read file
  ddf_entities_geo_income_groups <- read_csv("data/ddf--entities--geo--income_groups.csv") #read file
  co_emmision<-read_csv('data/ddf--datapoints--co2_emissions_tonnes_per_person--by--geo--time.csv') #read file
  co_2018<-filter(co_emmision,time==2018) #filter time==2018
  g77<-filter(ddf_entities_geo_country,g77_and_oecd_countries=='g77') #filter country==g77
  colnames(co_2018)[1]='country' #change colnames
  re=left_join(g77,co_2018,by='country') #leftjoin 2 tibble
  re2=select(re,country,income_groups,world_6region,co2_emissions_tonnes_per_person) #select variables I want
  region_rank=ddf_entities_geo_world_6region[,c('world_6region','rank')] #use rank instead of language
  income_rank=ddf_entities_geo_income_groups[,c('income_groups','rank')] #use rank instead of language
  re2$region_rank=left_join(re2,region_rank,by='world_6region')$rank #add rank
  re2$income_rank=left_join(re2,income_rank,by='income_groups')$rank #add rank
  re2$income_groups=as.factor(re2$income_groups) #change factor
  re2$world_6region=as.factor(re2$world_6region) #change factor
  re2=as.tibble(re2)
  return(re2)
}


#re2%>%group_by(income_groups,world_6region)%>%summarise(mean=mean(co2_emissions_tonnes_per_person))



