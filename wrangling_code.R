library(readr)
get_data<-function(){
  ddf_entities_geo_country <- read_csv("data/ddf--entities--geo--country.csv")
  ddf_entities_geo_world_6region <- read_csv("data/ddf--entities--geo--world_6region.csv")
  ddf_entities_geo_income_groups <- read_csv("data/ddf--entities--geo--income_groups.csv")
  co_emmision<-read_csv('data/ddf--datapoints--co2_emissions_tonnes_per_person--by--geo--time.csv')
  co_2018<-filter(co_emmision,time==2018)
  g77<-filter(ddf_entities_geo_country,g77_and_oecd_countries=='g77')
  colnames(co_2018)[1]='country'
  re=left_join(g77,co_2018,by='country')
  re2=select(re,country,income_groups,world_6region,co2_emissions_tonnes_per_person)
  region_rank=ddf_entities_geo_world_6region[,c('world_6region','rank')]
  income_rank=ddf_entities_geo_income_groups[,c('income_groups','rank')]
  re2$region_rank=left_join(re2,region_rank,by='world_6region')$rank
  re2$income_rank=left_join(re2,income_rank,by='income_groups')$rank
  re2$income_groups=as.factor(re2$income_groups)
  re2$world_6region=as.factor(re2$world_6region)
  re2=as.tibble(re2)
  return(re2)
}


#re2%>%group_by(income_groups,world_6region)%>%summarise(mean=mean(co2_emissions_tonnes_per_person))



