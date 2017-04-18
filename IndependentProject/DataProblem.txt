### Independent Project: Effective Niche Modeling Script to Compare Niche Overlap

#### The Question:
* When comparing different species of Physalis how much of their niche overlap? *
This will give a foundation in understanding how different species interact with each other. Understanding this can lead
to other questions like: How is self-incompatibility and unilateral compatibility maintained in allopatric and sympatric populations.

#### The data:
The raw data has been downloaded from SIENet, and contains many different rows of information 
that varies from: species name, collector, location, ect. The document will include the whole 
genus, Physalis, but would want to filter one species at a time. 

#### The approach:
1.) Filtering out the data  
	a.) Filter by species (have at top of file so can be changed)  
	b.) Filter to only have long/lat 
	c.) Remove all individuals that do not have long/lat information 
2.) Using Dismo tutorial run through Maxent niche modeling
3.) Make this whole process a for-loop so multiple species can be done.
