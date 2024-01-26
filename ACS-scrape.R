library(curl)

##Source:
###https://www.census.gov/data/developers/data-sets/acs-5year.html
##Variable Names:
###https://api.census.gov/data/2022/acs/acs5/variables.html

#Name Label
#B01001_001E	Estimate!!Total:
#B01001_011E	Estimate!!Total:!!Male:!!25 to 29 years
#B01001_012E	Estimate!!Total:!!Male:!!30 to 34 years
#B01001_013E	Estimate!!Total:!!Male:!!35 to 39 years
#B01001_014E	Estimate!!Total:!!Male:!!40 to 44 years
#B01001_035E	Estimate!!Total:!!Female:!!25 to 29 years
#B01001_036E	Estimate!!Total:!!Female:!!30 to 34 years
#B01001_037E	Estimate!!Total:!!Female:!!35 to 39 years
#B01001_038E	Estimate!!Total:!!Female:!!40 to 44 years

#Must enter individual key
my_key=""

variable_labels <- data.frame (var_id=c("NAME","B01001_001E","B01001_011E","B01001_012E","B01001_013E","B01001_014E","B01001_035E","B01001_036E","B01001_037E","B01001_038E"), 
                                      var_name=c("Place_name","Estimate!!Total:","Estimate!!Total:!!Male:!!25 to 29 years","Estimate!!Total:!!Male:!!30 to 34 years","Estimate!!Total:!!Male:!!35 to 39 years","Estimate!!Total:!!Male:!!40 to 44 years","Estimate!!Total:!!Female:!!25 to 29 years","Estimate!!Total:!!Female:!!30 to 34 years","Estimate!!Total:!!Female:!!35 to 39 years","Estimate!!Total:!!Female:!!40 to 44 years"))


#Build the url for scraping.
prefix <- "https://api.census.gov/data/2022/acs/acs5?get="
url_vars <- paste0(variable_labels[,1],collapse='&')
infix <- "&for=county:*&key="

new_url <- paste0(prefix,url_vars,infix,my_key)

##################################################################
#Now let's try all the variables at once

bigdata <- readLines(curl(url=new_url))

##################################################################
#Now let's export our data to csv.
write.csv(bigdata, "populationandage.csv", row.names=TRUE)



