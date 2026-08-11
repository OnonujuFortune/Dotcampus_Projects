## Title
# Global Food Waste Analysis
--- 

## Uncovering Patterns in Food Loss, Economic Impact and Regional Trends (2018-2024)

---

## Brief Intro
*Food wastage is a growing global concern with significant economic and environmental consequences. This project analyzes a global food wastage dataset spanning 2018-2024 across 20 countries and 8 food categories, aiming to uncover where waste is concentrated, how it's trending over time and what it's costing economically. The analysis combines exploratory data analysis, visualization and forecasting to move beyond numbers and identify patterns that are genuinely meaningful.* 

--- 

## My Task as an Analyst 
As the analyst on this project, my role was to source and clean the dataset, explore it for patterns across regions, food category and time, quantify the the economic impact of food waste, forecast near-term trends, and translate all of this into clear, actionable recommendations for better possible-waste management measures. This is presented through an interactive Power BI dashboard. 

--- 

## Tool Used
*Power BI*

--- 

## Data Preparation 
*In the initial data preparation phase, the following task were performed:* 

* Checked for missing values and duplicate records 
* Standardized column names and verified data types (Year as whole numbers, waste as decimals)
* Added a `Continent` field via country-to-region mapping.
* Derived an `Industrial Waste %` field as the complement of `Household Waste %`

--- 

## Data Exploratory Analysis

* Which countries and continents generate the most food waste?
* How does total food waste trend over time (2018-2024)?
* Which food category contribute most to the waste?
* How is economic loss distributed across regions and how closely does it track waste tonnage? 
* What's the split between household and industrial waste and it is consistent across countries? 
* Are the differences in waste between regions statistically significant, or could they be due to chance?
* Is there a relationship between population size and total waste generated?
* What would waste and economic loss look like in the near future (2025-2026) if current trends continue? 
 

 ## Analysis (Key Insights)

**Key Findings**

- Asia and Europe together account for over 60% of global food wastage in tons
- 125.3M tons wasted across 20 countries (2018–2024), tied to $125.2B in cumulative economic loss ($1,000 lost per ton, fairly consistent)
- Top three wasting countries (Turkey, Canada, Spain) differ only marginally from each other
- Total global waste has stayed roughly flat (17–18M tons/year) since 2018, with 2023 as the peak year


**Impact Analysis**

- Cumulative economic loss tracks tonnage ~1:1, at roughly $1,000 per ton
- Annual average loss ranges from $17.0B (2022) to $18.5B (2023)
- If the trend continues, 2026 waste is projected at ~18.3M tons (~$18.3B in losses)
- By continent (avg/year): Asia $6.2B · Europe $5.4B · North America $2.8B · South America $1.8B · Africa $0.87B · Oceania $0.85B


**Proposed Solutions**

- **Food Redistribution** — connect surplus fresh food to food banks before spoilage
- **Supply-Chain Investment** — cold-chain/packaging upgrades where industrial waste share is higher
- **Awareness Campaigns** — target consumer habits in Turkey, Canada, Spain
- **Track Quarterly** — revisit the 2026 forecast as new data arrives