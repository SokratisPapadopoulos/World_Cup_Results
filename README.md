# WorldCupResults

- [View the complete data analysis process](https://blossom-kookaburra-40c.notion.site/Portfolio-4372eca8a1b24ed1934502ceb79007f2?p=b5bfa9bd433e497992eb2d1e6d732862&pm=c)

## 📝 Project Task

Inspired by the past Football World Cup of 2022, I wanted a challenge to take my data prep skills and apply them to a relative database, then use the resulting cleansed and transformed data to make a Tableau dashboard to present.

I also wrote a user story to structure my project with, which was:

**As a**… Data Analyst;    **I want** … to give meaningfull insights from this database by answering certain questions and visualize them through Tableau;    **So I can**… practice and demonstrate my skills.

**NOTE:** I used the FIFA World Cup dataset from Kaggle which contains 2 csv files. The World Cups dataset show all information about all the World Cups in the history, while the World Cup Matches dataset shows all the results from the matches contested as part of the cups.

## ✏️ **Steps**

- ###### Step 1.

Load the dataset to Microsoft SQL Server.

- ###### Step 2.

Answered basic questions using the first table ‘WorldCups’ of the dataset.

- ###### Step 3.

Answered basic questions using the second table ‘WorldCupMatches’ of the dataset.

- ###### Step 4.

For Quality assurance I checked my results in the excel just to make sure that I don't have any discrepancies with the source streams.

- ###### Step 5.

Exported 3 new CSV’s files from the queries.
1. WorldCups_Cleaned
2. WorldCupMatches_Cleaned
3. WorldCupMatches_Tableau which is the viewtable I created with SQL for the calculations and the visualizations.

- ###### Step 6.

Create the data model after cleansed and prepared tables were read into Tableau.

- ###### Step 7.

Had to create 2 calculations fields to present teams with Finals and Semifinals.

- ###### Step 8.

Final Dashboard
![MainDashboard](https://user-images.githubusercontent.com/122797480/231509032-384a25ee-ac9a-40bc-b122-74f742b58ba0.png)
