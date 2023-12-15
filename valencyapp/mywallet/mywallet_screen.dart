// Top of Screen
final int amountOfFIATFunds;          // [Uses Bandwidth] The amount of FIAT funds in the Valency account
double availableAmount;               // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
List<double> dollarChange = [];       // [Calculated Locally] The total dollar change for each range (calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
List<double> percentageChange = [];   // [Calculated Locally] The total percentage change for each range (calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

// My Wallet: ~1/30th of a megabyte per asset request
List<double> oneDayIntervals = [];       // [Uses Bandwidth] Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
List<double> oneWeekIntervals = [];      // [Uses Bandwidth] Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
List<double> oneMonthIntervals = [];     // [Uses Bandwidth] Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
List<double> threeMonthIntervals = [];   // [Uses Bandwidth] Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
List<double> oneYearIntervals = [];      // [Uses Bandwidth] Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
List<double> maxIntervals = [];          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset
final int numberOfAssets;                // [Calculated Locally] The number of assets in the wallet
List<double> pricePerToken = [];         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)
List<String> privateKeys = [];           // [Calculated Locally] Each wallets private key (a cipher that is decrypted with user input of password)
List<String> publicKeys = [];            // [Calculated Locally] Each wallets public key