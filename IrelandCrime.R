# Q1-  
Ireland_Crime <- read.csv("IrelandCrime.csv", na = "" )
str(Ireland_Crime) # Shows the structure of the dataframe
head(Ireland_Crime, 10) # shows the first 10 rows of the dataframe


# Q2
names(Ireland_Crime)
# We can use the names() function to convert the variable names
names(Ireland_Crime)[1] <- "Region"                 # Converts the borough variable to Region
names(Ireland_Crime)[2] <- "Division"               # Converts the GARDA.DIVISION variable to Division
names(Ireland_Crime)[3] <- "OffenceCode"            # Converts the CODE variable to OffenceCode
names(Ireland_Crime)[4] <- "Offence"                # Converts the OFFENCE variable to Offence
names(Ireland_Crime)[5] <- "OffenceType"            # Converts the TYPE.OF.OFFENCE variable to OffenceType
names(Ireland_Crime)

# Since we only need statistics from 2015 to 2019 we will drop unrequired variables
Ireland_Crime_include_list <- c("Region", "Division", "OffenceCode", "Offence", "OffenceType",
                                "X2015Q1", "X2015Q2", "X2015Q3", "X2015Q4","X2016Q1", "X2016Q2", "X2016Q3", "X2016Q4",     
                                "X2017Q1", "X2017Q2", "X2017Q3", "X2017Q4", "X2018Q1", "X2018Q2", "X2018Q3", "X2018Q4",
                                "X2019Q1", "X2019Q2", "X2019Q3")

Ireland_Crime <- Ireland_Crime[Ireland_Crime_include_list] 
str(Ireland_Crime) # The new structure shows 24 variables


# Q3
Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "ATTEMPTS/THREATS TO MURDER/ASSAULTS/HARASSMENTS AND RELATED OFFENCES"] <- "Murder/assault/harassment"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "DANGEROUS OR NEGLIGENT ACTS"] <- "Dangerous acts"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "KIDNAPPING AND RELATED OFFENCES"] <- "Kidnapping"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "ROBBERY/EXTORTION AND HIJACKING OFFENCES"] <- "Robbery"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "THEFT AND RELATED OFFENCES"] <- "Theft"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "FRAUD/DECEPTION AND RELATED OFFENCES"] <- "Fraud"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "PUBLIC ORDER AND OTHER SOCIAL CODE OFFENCES"] <- "Public order"

Ireland_Crime$OffenceType[Ireland_Crime$OffenceType == "OFFENCES AGAINST GOVERNMENT/JUSTICE PROCEDURES AND ORGANISATION OF CRIME"] <- "Offences against government"


OffenceType <- factor(Ireland_Crime$OffenceType, levels = c("Murder/assault/harassment", "Dangerous acts",
                                                            "Kidnapping", "Robbery", "Theft", "Fraud", "Public order",
                                                            "Offences against government"))
Ireland_Crime$OffenceType <- OffenceType

summary(Ireland_Crime$OffenceType == "Fraud")

# Q4 


#Q5
install.packages("VIM")
library(VIM)
missing_values <- aggr(Ireland_Crime, prop = FALSE, numbers = TRUE)
# The missing data in Offence is missing completely at random 
# as the offence variable is not dependent on any other observed or unobsorved variable


# Q6 
max_no_of_crime <- subset(Ireland_Crime, )

# Q7 
Donegal_Crime <- subset(Ireland_Crime, Ireland_Crime$Division == "DONEGAL")
str(Donegal_Crime) # The structure shows 58 rows in the donegal_crime dataframe

plot(Donegal_Crime, OffenceType, type = "b"
     
# Q8
include_dublin_list <- 
dublin_crime <- subset(Ireland_Crime, Ireland_Crime$Region == "DUBLIN METROPOLITAN REGION" )

#Q9

# Q10 
dublin-crime.csv <- write.csv(dublin_crime)
