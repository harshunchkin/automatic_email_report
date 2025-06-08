
# Automatic Email Report Generator (Python + SQL + SMTP)

---
This is a report on Supply Chain Carbon Emission Sustainabilty using Python, SQL, HTML and modules such as SMTP and MIME to generate and HTML report and send it to a desired user (email).

## How to calculate CO~2~ emission?

| Known Quantities |
| :---             |
| Order Weight|
| Distance the order travels|
| Conversion factor for each item|

To calculate the total carbon emission we will use this formula : -

> E~CO2~ = W~Order~ x K~ConversionFactor~ x Distance

*One more thing..* To normalise the data we have to make sure the values of the known quantities are on base 1000 km and 2kg package.

The **Carbon Footprint** for various freight types can be found [here]("https://www.co2everything.com/co2e-of/freight-shipping").

Hence, the new formula would be :-

> E~CO2~ = (W~Order~)/2 x K~ConversionFactor~ x (Distance/1000) x C~FreightType~

After exporting the results to a csv file you can open the .ipynb file to analyse different aspects of the result.

Therefore, I have analysed the following : -

- Total carbon emissions per order.

- Total carbon emissions per month per freight transport type.

You can also extract insights such as which order was responsibel for highest carbon emission, which month had the highest carbon emission, etc.

## Important pre-requisites to follow before using SMTP

The recent policies have made direct login obsolete.

Follow these steps to set up an app password via 2FA authentication.

- First, go to your gmail account and enable 2-Factor-Authentication.

- Then go to "https://myaccount.google.com/u/4/apppasswords".

- Type your desired app name into the "app name" field and then generate the password.

- Then use the app password inplace of "from_password".

Everything's good now!

Lastly you can edit the html as you like but I've created a basic html file where you can insert images via MIME and codecs.

You can find the data in the "Data" folder.

Although I am still learning the ways of data analytics please feel free to ask me any questions related to this.