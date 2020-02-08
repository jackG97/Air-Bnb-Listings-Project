#!/usr/bin/env python
import sys

# Mapper to return local top 10 cars by weight
# Data source: https://data.world/kgarrett/inside-airbnb-london
# Data header: "id"	"name"	"host_id"	"host_name"	"neighbourhood_group"	"neighbourhood"	"latitude"	"longitude"	"room_type"	"price"	"minimum_nights"	"number_of_reviews"	"last_review"	"reviews_per_month"	"calculated_host_listings_count"	"availability_365"

# Initialise a list to store the top N records as a collection of touples (weight, record)
myList = []
n = 10	# Number of top N records

for line in sys.stdin:
	# remove leading and trailing whitespace
	line = line.strip()
	# split data values into list
	data = line.split("\t")
	
	# convert weight (currently a string) to int
	try:
		price = int(data[0])
	except ValueError:
		# ignore/discard this line
		continue
	
	# add (weight, record) touple to list
	myList.append( (price, line) )
	# sort list in reverse order
	myList.sort(reverse=True)
	
	# keep only first N records
	if len(myList) > n:
		myList = myList[:n]
		
# Print top N records
for (k,v) in myList:
	print(v)