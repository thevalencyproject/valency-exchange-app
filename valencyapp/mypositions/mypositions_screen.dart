// Top of Screen
final int amountOfFIATFunds;          // [Uses Bandwidth] The amount of FIAT funds in the Valency account
double availableAmount;               // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
double equityAmount;                  // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
List<double> dollarChange = [];       // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
List<double> percentageChange = [];   // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

// Open Positions: ~1/11th of a kilobyte per position request
List<String> assetName = [];                // [Uses Bandwidth] The name of the assets being used in positions
List<double> openingRatePerContract = [];   // [Uses Bandwidth] The opening rates of all positions (per contract)
List<double> currentRatePerContract = [];   // [Uses Bandwidth] The current rates of all positions (per contract)
List<int> numberOfContracts = [];           // [Uses Bandwidth] The number of contracts in all positions
List<DateTime> openingDate = [];            // [Uses Bandwidth] The opening date of all positions
List<DateTime> expiryDate = [];             // [Uses Bandwidth] The expiration date of all positions
List<int> leverage = [];                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
List<double> totalOpeningRate = [];         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
List<double> totalCurrentRate = [];         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)
List<double> stopLoss = [];                 // [Uses Bandwidth] If there is a stoploss for the position, it will be a non-zero number, if there isn't, it will be 0
List<double> takeProfit = [];               // [Uses Bandwidth] If there is a take profit for the position, it will be a non-zero number, if there isn't, it will be 0

// Closed Positions (only uses bandwidth if logging on from a new device (or if non-cached), otherwise this data can be cached): 
List<String> closedAssetName = [];                // [Uses Bandwidth] The name of the assets being used in positions
List<double> closedOpeningRatePerContract = [];   // [Uses Bandwidth] The opening rates of all positions (per contract)
List<double> closedClosingRatePerContract = [];   // [Uses Bandwidth] The current rates of all positions (per contract)
List<int> closedNumberOfContracts = [];           // [Uses Bandwidth] The number of contracts in all positions
List<DateTime> closedOpeningDate = [];            // [Uses Bandwidth] The opening date of all positions
List<DateTime> closedDate = [];                   // [Uses Bandwidth] The expiration date of all positions
List<int> closedLeverage = [];                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
List<double> closedTotalOpeningRate = [];         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
List<double> closedTotalClosingRate = [];         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)