### Independent Project: Effective Niche Modeling Script to Compare Niche Overlap

#### The Question:
**When comparing different species of Physalis how much of their niche overlap?**  
This will give a foundation in understanding how different species interact with each other. Understanding this can lead
to other questions like: How is self-incompatibility and unilateral compatibility maintained in allopatric and sympatric populations.

#### The data:
The raw data has been downloaded from [SIENet](http://swbiodiversity.org/seinet/collections/list.php?taxa=Physalis&thes=1&type=1&db=all&page=1). SIENet
is an onlinedata base that aggreates different herbarium collections online. I will be down loading all the data points for plants in the *physalis* genus and cvs.
containsThis cvs has 13543 rows (total number of accessions miss the header) and 66 colunms which contains the different information of each species.
Row 1: Column Headers  
id	institutionCode	collectionCode	ownerInstitutionCode	basisOfRecord	occurrenceID	catalogNumber	otherCatalogNumbers	kingdom	phylum	class	order	family	scientificName	scientificNameAuthorship	genus	specificEpithet	taxonRank	infraspecificEpithet	identifiedBy	dateIdentified	identificationReferences	identificationRemarks	taxonRemarks	identificationQualifier	typeStatus	recordedBy	recordedByID	associatedCollectors	recordNumber	eventDate	year	month	day	startDayOfYear	endDayOfYear	verbatimEventDate	occurrenceRemarks	habitat	substrate	verbatimAttributes	fieldNumber	informationWithheld	dataGeneralizations	dynamicProperties	associatedTaxa	reproductiveCondition	establishmentMeans	cultivationStatus	lifeStage	sex	individualCount	samplingProtocol	samplingEffort	preparations	country	stateProvince	county	municipality	locality	locationRemarks	localitySecurity	localitySecurityReason	decimalLatitude	decimalLongitude	geodeticDatum	coordinateUncertaintyInMeters	verbatimCoordinates	georeferencedBy	georeferenceProtocol	georeferenceSources	georeferenceVerificationStatus	georeferenceRemarks	minimumElevationInMeters	maximumElevationInMeters	minimumDepthInMeters	maximumDepthInMeters	verbatimDepth	verbatimElevation	disposition	language	recordEnteredBy	modified	sourcePrimaryKey	collId	recordId	references

#### The approach:
1.) Filtering out the data  
	a.) Filter by species (have at top of file so can be changed)  
		There is three different genus that will be filtered: P. crassifolia, P. philadelphica, P. virginiana, P. heterophylla
	b.) Filter to only have long/lat  
		i.)	Remove all individuals that do not have long/lat information  
2.) Using [Dismo tutorial](https://cran.r-project.org/web/packages/dismo/vignettes/sdm.pdf) from R run through Maxent niche modeling  
	a.) Maxent is a alogerathim that mathematical models that predicts the geographical distrubition of the species based on locality points and climate data (temperature, precipitation, soil type, ect.)
3.) Make this whole process a for-loop so multiple species can be done.

