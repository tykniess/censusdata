library(curl)

##Source:
###https://www.census.gov/data/developers/data-sets/acs-5year.html
##Variable Names:
###https://api.census.gov/data/2022/acs/acs5/variables.html

#Name Label
#B02001_001E	Estimate!!Total:
#B02001_002E	Estimate!!Total:!!White alone
#B02001_003E	Estimate!!Total:!!Black or African American alone
#B02001_004E	Estimate!!Total:!!American Indian and Alaska Native alone
#B02001_005E	Estimate!!Total:!!Asian alone
#B02001_006E	Estimate!!Total:!!Native Hawaiian and Other Pacific Islander alone
#B02001_007E	Estimate!!Total:!!Some Other Race alone
#B02001_008E	Estimate!!Total:!!Two or More Races:

#Must enter individual key
my_key=""

variable_labels <- data.frame (var_id=c("NAME","B02001_001E","B02001_002E","B02001_003E","B02001_004E","B02001_005E","B02001_006E","B02001_007E","B02001_008E"), 
                                      var_name=c("Place_name","Estimate!!Total:","Estimate!!Total:!!White alone","Estimate!!Total:!!Black or African American alone","Estimate!!Total:!!American Indian and Alaska Native alone","Estimate!!Total:!!Male:!!Asian alone","Estimate!!Total:!!Female:!!Native Hawaiian and Other Pacific Islander alone","Estimate!!Total:!!Some Other Race alone","Estimate!!Total:!!Two or More Races:"))


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
write.csv(bigdata, "raceandethnicity.csv", row.names=TRUE)



