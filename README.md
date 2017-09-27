README
================

This R package provides easy access to college sports (NCAA) data via stats.ncaa.org. Note if you are trying to get baseball data, I would look at Bill Petti's [baseballr](http://billpetti.github.io/baseballr/) pkg.

Here are the list of sports that this package covers.

| names                   | id  |
|:------------------------|:----|
| baseball                | MBA |
| mens basketball         | MBB |
| football                | MFB |
| mens ice hockey         | MIH |
| mens lacrosse           | MLA |
| mens soccer             | MSO |
| mens tennis             | MTE |
| mens volleyball         | MVB |
| womens basketball       | WBB |
| field hockey            | WFH |
| womens ice hockey       | WIH |
| womens lacrosse         | WLA |
| softball                | WSB |
| womens soccer           | WSO |
| womens beach volleyball | WSV |
| womens tennis           | WTE |
| womens volleyball       | WVB |

Also this package will scale to more years as the NCAA makes data available. Right now stats.ncaa.org is slowly providing more data! VERY EXCITING!

Install
-------

``` r
# from github:
# devtools::install_github("meysubb/collegeballR")
```

Example
-------

I'll put together a Vignette once a few more functions are finished up.

Let's try and run something.

``` r
teams <- team_mapping(2016,"Men's Basketball")
head(teams,6)
```

    ##   team_id         team_name year
    ## 4   26172  A&M-Corpus Chris 2016
    ## 5       2 Abilene Christian 2016
    ## 6     721         Air Force 2016
    ## 7       5             Akron 2016
    ## 8       8           Alabama 2016
    ## 9       6       Alabama A&M 2016

I like Texas A&M for obvious reasons. So we'll go with them, for reference the TAMU id is 697 across all sports.

TAMU Women Soccer's season stats in 2015 look like:

``` r
kable(team_stats(697, 2015, "Women's Soccer",by="Season"))
```

|     | Player          |  Goals|  Assists|  Points|  ShAtt|  Fouls|  Red Cards|  Yellow Cards| GC  |  Goal App|  GGS| Goalie Min. Plyd |   GA|    GAA|  Saves|  SV Pct|  Shutouts|  G Wins|  G Loss| DSaves |  Corners|   PS|  PSA|  GWG|  year|
|-----|:----------------|------:|--------:|-------:|------:|------:|----------:|-------------:|:----|---------:|----:|:-----------------|----:|------:|------:|-------:|---------:|-------:|-------:|:-------|--------:|----:|----:|----:|-----:|
| 25  | Totals          |     71|       60|     202|    544|    217|         NA|            10| NA  |        NA|   NA| 148,148          |   27|  0.984|     87|   0.763|         9|      NA|      NA| NA     |      156|    1|    2|   22|  2015|
| 26  | Opponent Totals |     27|       22|      76|    296|    297|          1|            27| NA  |        NA|   NA| 148,148          |   71|  2.588|    184|   0.722|         1|      NA|      NA| NA     |      105|    1|    1|    3|  2015|

Alright the Aggies had a good basketball team in 2015-2016, let's look at the player's season stat. Note for seasons Year1-Year2, Year2 is what you want to use in the functions. For example the 2015 to 2016 season is denoted for 2016.

A little wrinkle though, instead of looking at the average season stats. Let's look at game by game data for all players on the TAMU roster.

``` r
kable(player_stats(697,2016,"MBB",by="game"))
```

| Player                | team      | opponent         | game\_date | Pos | MP     | FGM | FGA | 3FG | 3FGA | FT  | FTA | PTS | ORebs | DRebs | Tot Reb | AST | TO  | STL | BLK | Fouls | location                                 |
|:----------------------|:----------|:-----------------|:-----------|:----|:-------|:----|:----|:----|:-----|:----|:----|:----|:------|:------|:--------|:----|:----|:----|:----|:------|:-----------------------------------------|
| Caruso, Alex          | Texas A&M | USC Upstate      | 2015-11-13 |     | 25:00  | 2   | 4   | 1   | 1    |     |     | 5   | 1     | 2     | 3       | 6   | 2   | 1   | 1   | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | USC Upstate      | 2015-11-13 |     | 24:00  |     | 1   |     |      |     |     |     |       | 2     | 2       | 8   | 3   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | USC Upstate      | 2015-11-13 |     | 27:00  | 5   | 10  | 3   | 7    | 2   | 5   | 15  | 2     | 4     | 6       | 3   | 2   |     |     | 1     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | USC Upstate      | 2015-11-13 |     | 17:00  | 6   | 9   |     |      |     | 1   | 12  | 2     | 3     | 5       | 1   | 3   |     | 1   | 1     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | USC Upstate      | 2015-11-13 |     | 19:00  | 5   | 5   |     |      | 6   | 7   | 16  | 1     | 6     | 7       | 2   |     | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | USC Upstate      | 2015-11-13 |     | 22:00  | 6   | 10  | 4   | 7    |     |     | 16  |       | 4     | 4       | 3   | 1   |     |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | USC Upstate      | 2015-11-13 |     | 23:00  | 7   | 11  | 5   | 9    | 1   | 2   | 20  | 1     | 5     | 6       | 1   | 1   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Thomas, Elijah        | Texas A&M | USC Upstate      | 2015-11-13 |     | 18:00  | 3   | 3   |     |      | 5   | 10  | 11  | 1     | 4     | 5       | 3   | 2   |     | 2   | 3     | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | USC Upstate      | 2015-11-13 |     | 3:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     | 3     | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | USC Upstate      | 2015-11-13 |     | 4:00   |     |     |     |      | 1   | 2   | 1   |       |       |         | 2   | 1   |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | USC Upstate      | 2015-11-13 |     | 2:00   |     |     |     |      |     |     |     |       | 1     | 1       |     | 2   |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | USC Upstate      | 2015-11-13 |     | 16:00  | 4   | 4   |     |      |     |     | 8   |       | 3     | 3       | 3   | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Southeastern La. | 2015-11-16 |     | 19:00  | 2   | 3   |     | 1    |     |     | 4   | 1     | 2     | 3       | 5   | 6   | 2   |     | 4     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Southeastern La. | 2015-11-16 |     | 23:00  | 3   | 7   | 2   | 2    |     |     | 8   |       |       |         | 4   | 2   | 2   |     | 2     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Southeastern La. | 2015-11-16 |     | 27:00  | 6   | 12  | 6   | 11   | 2   | 2   | 20  | 1     | 3     | 4       | 2   | 2   | 1   | 1   | 1     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Southeastern La. | 2015-11-16 |     | 17:00  | 4   | 6   | 1   | 1    | 3   | 6   | 12  | 2     | 1     | 3       | 5   | 1   |     | 1   | 3     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Southeastern La. | 2015-11-16 |     | 24:00  | 6   | 8   |     |      | 6   | 9   | 18  | 4     | 8     | 12      | 3   | 2   | 2   |     | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Southeastern La. | 2015-11-16 |     | 26:00  | 5   | 10  | 2   | 5    | 2   | 3   | 14  | 2     | 2     | 4       | 5   | 2   | 3   | 1   | 3     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Southeastern La. | 2015-11-16 |     | 23:00  | 3   | 5   | 3   | 5    | 2   | 2   | 11  | 1     | 4     | 5       |     | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Thomas, Elijah        | Texas A&M | Southeastern La. | 2015-11-16 |     | 13:00  | 3   | 4   |     |      |     | 3   | 6   | 1     | 5     | 6       | 1   | 2   |     | 2   | 5/    | Reed Arena (College Station, TX)         |
| Byers, Frank          | Texas A&M | Southeastern La. | 2015-11-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     | 1   |     |       | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Southeastern La. | 2015-11-16 |     | 3:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Southeastern La. | 2015-11-16 |     | 4:00   |     | 1   |     |      | 1   | 2   | 1   | 1     |       | 1       | 2   |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | Southeastern La. | 2015-11-16 |     | 2:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     | 1     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Southeastern La. | 2015-11-16 |     | 18:00  | 1   | 3   |     |      | 4   | 6   | 6   | 4     | 3     | 7       |     | 2   |     |     | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 21:00  | 2   | 6   |     | 2    | 2   | 2   | 6   | 1     | 1     | 2       | 5   | 2   | 3   | 1   | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 25:00  | 2   | 3   | 1   | 2    | 2   | 2   | 7   |       | 1     | 1       | 4   | 1   | 2   |     | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 24:00  | 5   | 11  | 1   | 6    | 4   | 4   | 15  | 1     | 6     | 7       | 5   | 3   |     |     | 2     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 22:00  | 6   | 7   | 3   | 4    |     |     | 15  | 1     | 3     | 4       | 1   | 2   |     |     | 4     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 23:00  | 5   | 6   |     |      | 6   | 6   | 16  | 1     | 7     | 8       | 1   | 2   | 2   | 1   | 1     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 25:00  | 2   | 7   | 2   | 4    |     |     | 6   |       | 3     | 3       | 3   | 3   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 22:00  | 6   | 9   | 2   | 4    |     |     | 14  | 2     | 2     | 4       | 2   | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Thomas, Elijah        | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 13:00  | 2   | 5   |     |      |     |     | 4   | 1     | 2     | 3       | 1   |     |     |     | 5/    | Reed Arena (College Station, TX)         |
| Byers, Frank          | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 1:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     | 1     | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 2:00   |     |     |     |      |     | 2   |     |       |       |         |     |     |     | 1   |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 3:00   |     |     |     |      | 4   | 4   | 4   |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 2:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | A&M-Corpus Chris | 2015-11-19 |     | 17:00  | 1   | 2   |     |      | 6   | 6   | 8   | 1     | 3     | 4       |     | 2   |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | UNC Asheville    | 2015-11-21 |     | 25:00  | 3   | 8   |     |      | 2   | 2   | 8   |       | 3     | 3       | 3   | 1   | 3   |     | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | UNC Asheville    | 2015-11-21 |     | 24:00  | 2   | 6   | 1   | 2    |     |     | 5   | 1     | 1     | 2       | 2   | 2   | 1   |     |       | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | UNC Asheville    | 2015-11-21 |     | 25:00  | 5   | 9   | 2   | 5    |     |     | 12  |       | 2     | 2       | 2   |     | 1   |     | 3     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | UNC Asheville    | 2015-11-21 |     | 22:00  | 4   | 9   | 2   | 4    | 2   | 2   | 12  | 3     | 6     | 9       | 4   | 1   |     |     | 2     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | UNC Asheville    | 2015-11-21 |     | 15:00  | 4   | 6   |     |      | 3   | 5   | 11  | 3     | 3     | 6       | 1   | 1   |     |     | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | UNC Asheville    | 2015-11-21 |     | 24:00  | 4   | 6   |     | 1    |     |     | 8   | 1     | 3     | 4       | 2   |     | 2   |     | 1     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | UNC Asheville    | 2015-11-21 |     | 22:00  | 1   | 6   |     | 3    |     |     | 2   |       | 2     | 2       | 3   | 2   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Thomas, Elijah        | Texas A&M | UNC Asheville    | 2015-11-21 |     | 19:00  | 3   | 5   |     |      | 1   | 5   | 7   | 1     | 1     | 2       | 1   | 1   |     | 2   | 3     | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | UNC Asheville    | 2015-11-21 |     | 3:00   | 1   | 2   |     | 1    |     |     | 2   |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | UNC Asheville    | 2015-11-21 |     | 3:00   | 2   | 2   |     |      |     |     | 4   |       | 1     | 1       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | UNC Asheville    | 2015-11-21 |     | 1:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | UNC Asheville    | 2015-11-21 |     | 17:00  | 2   | 3   |     |      |     |     | 4   | 1     | 6     | 7       |     | 1   |     |     | 3     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Texas            | 2015-11-25 | G   | 22:00  | 1   | 3   |     | 2    |     |     | 2   |       | 3     | 3       | 2   | 1   |     |     | 3     | Atlantis, Paradise Island, Bahamas       |
| Collins, Anthony      | Texas A&M | Texas            | 2015-11-25 | G   | 34:00  | 3   | 4   | 2   | 3    | 7   | 7   | 15  | 2     | 3     | 5       | 6   | 5   |     |     | 2     | Atlantis, Paradise Island, Bahamas       |
| House, Danuel         | Texas A&M | Texas            | 2015-11-25 | G   | 35:00  | 6   | 14  | 2   | 7    | 5   | 12  | 19  | 1     | 6     | 7       | 1   | 2   | 1   |     | 3     | Atlantis, Paradise Island, Bahamas       |
| Trocha-Morelos, Tonny | Texas A&M | Texas            | 2015-11-25 | C   | 20:00  | 2   | 2   | 1   | 1    | 1   | 1   | 6   | 1     | 1     | 2       | 1   |     | 1   | 1   | 4     | Atlantis, Paradise Island, Bahamas       |
| Davis, Tyler          | Texas A&M | Texas            | 2015-11-25 | C   | 24:00  | 5   | 7   |     |      | 4   | 5   | 14  | 4     |       | 4       | 1   | 2   | 1   | 1   | 4     | Atlantis, Paradise Island, Bahamas       |
| Gilder, Admon         | Texas A&M | Texas            | 2015-11-25 |     | 18:00  | 3   | 5   | 2   | 2    | 4   | 4   | 12  |       | 2     | 2       | 1   |     |     |     | 2     | Atlantis, Paradise Island, Bahamas       |
| Hogg, DJ              | Texas A&M | Texas            | 2015-11-25 |     | 13:00  | 1   | 4   | 1   | 4    | 2   | 2   | 5   | 1     |       | 1       |     | 1   |     |     | 2     | Atlantis, Paradise Island, Bahamas       |
| Thomas, Elijah        | Texas A&M | Texas            | 2015-11-25 |     | 7:00   | 1   | 2   |     |      |     |     | 2   | 1     | 1     | 2       |     | 1   |     |     | 1     | Atlantis, Paradise Island, Bahamas       |
| Jones, Jalen          | Texas A&M | Texas            | 2015-11-25 |     | 21:00  | 2   | 8   |     | 3    | 5   | 6   | 9   |       | 6     | 6       | 1   |     |     |     | 4     | Atlantis, Paradise Island, Bahamas       |
| Miller, Tavario       | Texas A&M | Texas            | 2015-11-25 |     | 6:00   |     |     |     |      |     |     |     |       |       |         |     |     |     | 1   |       | Atlantis, Paradise Island, Bahamas       |
| Caruso, Alex          | Texas A&M | Gonzaga          | 2015-11-26 | G   | 28:00  | 3   | 6   |     | 1    | 2   | 2   | 8   |       |       |         | 5   | 3   | 3   |     | 4     | Atlantis, Paradise Island, Bahamas       |
| Collins, Anthony      | Texas A&M | Gonzaga          | 2015-11-26 | G   | 32:00  | 1   | 6   |     | 1    |     |     | 2   |       | 1     | 1       | 3   | 1   |     |     | 1     | Atlantis, Paradise Island, Bahamas       |
| House, Danuel         | Texas A&M | Gonzaga          | 2015-11-26 | G   | 32:00  | 6   | 9   | 2   | 4    | 5   | 6   | 19  | 1     | 3     | 4       | 2   | 1   | 1   |     |       | Atlantis, Paradise Island, Bahamas       |
| Trocha-Morelos, Tonny | Texas A&M | Gonzaga          | 2015-11-26 | C   | 22:00  | 5   | 6   | 4   | 4    |     |     | 14  |       | 3     | 3       |     | 1   | 1   | 2   | 2     | Atlantis, Paradise Island, Bahamas       |
| Davis, Tyler          | Texas A&M | Gonzaga          | 2015-11-26 | C   | 24:00  | 1   | 3   |     |      | 4   | 6   | 6   |       | 2     | 2       |     | 2   | 1   |     | 3     | Atlantis, Paradise Island, Bahamas       |
| Gilder, Admon         | Texas A&M | Gonzaga          | 2015-11-26 |     | 11:00  |     | 4   |     | 1    |     |     |     | 1     | 1     | 2       | 2   | 1   | 1   |     |       | Atlantis, Paradise Island, Bahamas       |
| Hogg, DJ              | Texas A&M | Gonzaga          | 2015-11-26 |     | 17:00  | 3   | 3   | 1   | 1    |     |     | 7   |       | 2     | 2       |     | 1   |     |     | 2     | Atlantis, Paradise Island, Bahamas       |
| Thomas, Elijah        | Texas A&M | Gonzaga          | 2015-11-26 |     | 4:00   |     |     |     |      |     |     |     |       | 1     | 1       |     | 1   |     | 1   | 2     | Atlantis, Paradise Island, Bahamas       |
| Jones, Jalen          | Texas A&M | Gonzaga          | 2015-11-26 |     | 21:00  | 2   | 10  |     | 2    | 2   | 2   | 6   | 1     | 3     | 4       | 1   |     |     |     | 1     | Atlantis, Paradise Island, Bahamas       |
| Miller, Tavario       | Texas A&M | Gonzaga          | 2015-11-26 |     | 9:00   |     |     |     |      |     |     |     | 1     | 1     | 2       | 1   | 1   |     |     |       | Atlantis, Paradise Island, Bahamas       |
| Caruso, Alex          | Texas A&M | Syracuse         | 2015-11-27 | G   | 26:00  |     | 3   |     | 3    |     |     |     |       | 3     | 3       | 5   | 5   | 3   |     |       | Atlanis, Pardise Island, Bahamas         |
| Collins, Anthony      | Texas A&M | Syracuse         | 2015-11-27 | G   | 24:00  | 1   | 1   |     |      |     |     | 2   |       |       |         | 5   |     |     |     | 2     | Atlanis, Pardise Island, Bahamas         |
| House, Danuel         | Texas A&M | Syracuse         | 2015-11-27 | G   | 33:00  | 5   | 12  | 3   | 8    | 2   | 2   | 15  | 1     | 4     | 5       | 2   |     |     |     | 1     | Atlanis, Pardise Island, Bahamas         |
| Trocha-Morelos, Tonny | Texas A&M | Syracuse         | 2015-11-27 | C   | 24:00  | 3   | 11  |     | 1    |     |     | 6   | 6     | 2     | 8       | 2   | 1   |     |     | 4     | Atlanis, Pardise Island, Bahamas         |
| Davis, Tyler          | Texas A&M | Syracuse         | 2015-11-27 | C   | 22:00  | 3   | 5   |     |      | 2   | 3   | 8   | 1     | 6     | 7       | 2   | 1   | 1   | 3   | 2     | Atlanis, Pardise Island, Bahamas         |
| Gilder, Admon         | Texas A&M | Syracuse         | 2015-11-27 |     | 17:00  | 3   | 6   | 1   | 2    | 1   | 2   | 8   | 2     |       | 2       |     | 1   |     |     | 1     | Atlanis, Pardise Island, Bahamas         |
| Hogg, DJ              | Texas A&M | Syracuse         | 2015-11-27 |     | 21:00  | 2   | 8   | 1   | 5    |     |     | 5   |       | 3     | 3       | 2   | 1   |     |     |       | Atlanis, Pardise Island, Bahamas         |
| Thomas, Elijah        | Texas A&M | Syracuse         | 2015-11-27 |     | 3:00   |     |     |     |      |     |     |     |       |       |         |     | 2   |     | 1   | 3     | Atlanis, Pardise Island, Bahamas         |
| Jones, Jalen          | Texas A&M | Syracuse         | 2015-11-27 |     | 26:00  | 10  | 17  | 1   | 1    | 2   | 4   | 23  | 3     | 3     | 6       |     | 2   |     |     | 5/    | Atlanis, Pardise Island, Bahamas         |
| Dobbins, Kyle         | Texas A&M | Syracuse         | 2015-11-27 |     |        |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Atlanis, Pardise Island, Bahamas         |
| Miller, Tavario       | Texas A&M | Syracuse         | 2015-11-27 |     | 4:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     | 1     | Atlanis, Pardise Island, Bahamas         |
| Caruso, Alex          | Texas A&M | FGCU             | 2015-12-02 |     | 30:00  | 3   | 5   |     | 1    | 1   | 1   | 7   | 3     | 1     | 4       |     | 2   | 2   |     | 4     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | FGCU             | 2015-12-02 |     | 32:00  | 1   | 3   |     | 1    | 2   | 2   | 4   |       | 2     | 2       | 9   | 2   | 3   |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | FGCU             | 2015-12-02 |     | 15:00  | 1   | 7   | 1   | 3    |     |     | 3   | 1     |       | 1       | 1   |     | 2   |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | FGCU             | 2015-12-02 |     | 31:00  | 8   | 14  | 1   | 2    | 5   | 6   | 22  | 1     | 6     | 7       |     | 2   | 1   |     | 3     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | FGCU             | 2015-12-02 |     | 25:00  | 4   | 7   | 1   | 2    |     | 5   | 9   | 4     | 2     | 6       |     | 1   |     |     | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | FGCU             | 2015-12-02 |     | 20:00  | 3   | 8   |     | 3    | 1   | 1   | 7   |       | 4     | 4       | 1   |     | 2   |     | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | FGCU             | 2015-12-02 |     | 25:00  | 3   | 16  |     | 5    | 9   | 10  | 15  |       | 4     | 4       | 3   | 2   | 1   |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | FGCU             | 2015-12-02 |     | 6:00   |     |     |     |      | 1   | 2   | 1   |       |       |         |     |     |     | 1   | 1     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | FGCU             | 2015-12-02 |     | 16:00  | 3   | 4   |     |      | 1   | 2   | 7   | 2     | 1     | 3       | 1   | 1   | 1   | 2   | 4     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Arizona St.      | 2015-12-05 | G   | 30:00  | 6   | 10  | 2   | 4    | 1   | 2   | 15  | 1     | 2     | 3       | 4   | 1   | 2   |     | 4     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Collins, Anthony      | Texas A&M | Arizona St.      | 2015-12-05 | G   | 32:00  |     | 5   |     | 1    | 2   | 2   | 2   |       | 2     | 2       | 2   | 1   | 1   |     | 3     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| House, Danuel         | Texas A&M | Arizona St.      | 2015-12-05 | G   | 34:00  | 6   | 21  | 3   | 15   | 2   | 5   | 17  | 1     | 7     | 8       | 2   | 1   |     | 1   |       | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Jones, Jalen          | Texas A&M | Arizona St.      | 2015-12-05 | F   | 29:00  | 2   | 10  |     | 2    | 2   | 4   | 6   | 1     | 6     | 7       | 1   | 2   |     |     | 4     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Trocha-Morelos, Tonny | Texas A&M | Arizona St.      | 2015-12-05 | C   | 19:00  |     | 4   |     | 1    |     |     |     | 2     | 4     | 6       | 1   | 1   | 1   |     | 4     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Gilder, Admon         | Texas A&M | Arizona St.      | 2015-12-05 |     | 14:00  |     | 3   |     | 1    | 1   | 4   | 1   |       |       |         |     | 2   |     |     | 1     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Hogg, DJ              | Texas A&M | Arizona St.      | 2015-12-05 |     | 13:00  | 1   | 3   | 1   | 2    |     |     | 3   |       | 1     | 1       |     |     |     |     | 1     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Thomas, Elijah        | Texas A&M | Arizona St.      | 2015-12-05 |     | 2:00   |     |     |     |      |     |     |     |       | 1     | 1       |     |     |     |     | 1     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Miller, Tavario       | Texas A&M | Arizona St.      | 2015-12-05 |     | 11:00  | 1   | 1   |     |      |     |     | 2   | 2     | 2     | 4       | 1   | 2   | 2   | 1   | 1     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Davis, Tyler          | Texas A&M | Arizona St.      | 2015-12-05 |     | 16:00  | 3   | 4   |     |      | 2   | 4   | 8   | 5     | 2     | 7       |     | 4   |     | 3   | 4     | TEMPE-WELLS FARGO ARENA/NED WULK COURT   |
| Caruso, Alex          | Texas A&M | Kansas St.       | 2015-12-12 |     | 35:00  | 4   | 5   | 2   | 3    | 3   | 4   | 13  |       | 3     | 3       | 9   | 1   | 6   |     | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Kansas St.       | 2015-12-12 |     | 14:00  | 1   | 1   | 1   | 1    | 2   | 2   | 5   |       |       |         |     |     |     |     | 4     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Kansas St.       | 2015-12-12 |     | 35:00  | 2   | 11  |     | 3    | 3   | 6   | 7   | 1     | 4     | 5       | 3   | 3   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Kansas St.       | 2015-12-12 |     | 23:00  | 2   | 5   |     | 1    |     | 1   | 4   |       | 2     | 2       | 3   | 3   | 2   | 2   | 1     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Kansas St.       | 2015-12-12 |     | 20:00  | 5   | 5   |     |      |     | 2   | 10  | 1     | 4     | 5       | 1   | 2   |     | 1   | 4     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Kansas St.       | 2015-12-12 |     | 23:00  | 3   | 5   | 1   | 2    | 2   | 2   | 9   |       | 1     | 1       | 2   | 1   | 2   |     |       | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Kansas St.       | 2015-12-12 |     | 15:00  | 2   | 3   | 1   | 2    |     |     | 5   | 2     | 2     | 4       |     | 2   |     |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Kansas St.       | 2015-12-12 |     | 30:00  | 8   | 15  | 2   | 2    | 7   | 8   | 25  | 3     | 6     | 9       |     |     |     |     | 3     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Kansas St.       | 2015-12-12 |     | 5:00   |     |     |     |      |     |     |     |       | 1     | 1       |     | 1   |     |     | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Baylor           | 2015-12-19 |     | 26:00  | 2   | 4   |     |      | 2   | 2   | 6   | 3     |       | 3       | 8   | 1   | 2   |     | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Baylor           | 2015-12-19 |     | 32:00  | 2   | 6   | 2   | 4    | 2   | 2   | 8   | 1     | 2     | 3       | 7   | 2   | 2   |     | 3     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Baylor           | 2015-12-19 |     | 29:00  | 6   | 13  | 4   | 9    | 1   | 1   | 17  | 2     | 6     | 8       | 1   | 2   | 2   |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Baylor           | 2015-12-19 |     | 26:00  | 8   | 15  | 1   | 3    |     |     | 17  | 1     | 5     | 6       | 2   | 1   | 1   | 1   | 1     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Baylor           | 2015-12-19 |     | 27:00  | 6   | 6   |     |      | 3   | 6   | 15  | 1     | 4     | 5       |     | 2   |     | 2   | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Baylor           | 2015-12-19 |     | 15:00  | 1   | 7   |     | 1    | 3   | 4   | 5   | 1     | 3     | 4       | 2   | 1   |     |     | 1     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Baylor           | 2015-12-19 |     | 14:00  | 1   | 5   | 1   | 4    | 1   | 3   | 4   |       | 1     | 1       | 2   | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Byers, Frank          | Texas A&M | Baylor           | 2015-12-19 |     | 1:00   | 1   | 1   |     |      |     | 1   | 2   |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Baylor           | 2015-12-19 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Baylor           | 2015-12-19 |     | 2:00   |     |     |     |      |     | 2   |     |       |       |         |     | 1   |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | Baylor           | 2015-12-19 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Baylor           | 2015-12-19 |     | 12:00  | 1   | 2   |     |      |     | 4   | 2   | 4     | 1     | 5       | 1   |     |     |     | 4     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Baylor           | 2015-12-19 |     | 14:00  | 2   | 4   |     | 1    |     | 3   | 4   | 2     | 2     | 4       |     | 1   |     | 2   |       | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Cal Poly         | 2015-12-29 |     | 29:00  | 3   | 6   | 2   | 5    |     |     | 8   | 3     | 2     | 5       | 6   | 1   | 2   | 1   | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Cal Poly         | 2015-12-29 |     | 26:00  | 4   | 8   | 3   | 5    |     |     | 11  |       | 1     | 1       | 3   | 1   | 1   |     |       | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Cal Poly         | 2015-12-29 |     | 24:00  | 5   | 14  | 2   | 10   |     | 1   | 12  |       | 3     | 3       | 2   |     | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Cal Poly         | 2015-12-29 |     | 23:00  | 3   | 8   | 1   | 2    | 4   | 6   | 11  | 4     | 2     | 6       | 2   | 2   | 1   | 2   | 2     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Cal Poly         | 2015-12-29 |     | 24:00  | 8   | 9   |     |      | 2   | 7   | 18  | 5     | 3     | 8       | 2   | 2   |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Cal Poly         | 2015-12-29 |     | 19:00  | 3   | 5   | 1   | 3    | 2   | 2   | 9   |       | 2     | 2       | 3   |     | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Cal Poly         | 2015-12-29 |     | 22:00  | 4   | 10  | 1   | 6    |     | 3   | 9   | 1     | 1     | 2       | 1   |     | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Cal Poly         | 2015-12-29 |     | 2:00   |     |     |     |      |     |     |     |       |       |         |     | 1   |     |     | 1     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Cal Poly         | 2015-12-29 |     | 14:00  |     |     |     |      |     |     |     | 1     | 5     | 6       |     |     |     | 1   | 1     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Cal Poly         | 2015-12-29 |     | 17:00  | 1   | 3   | 1   | 2    | 1   | 2   | 4   |       | 6     | 6       | 2   |     |     |     | 2     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Arkansas         | 2016-01-02 |     | 26:00  | 4   | 5   | 2   | 2    | 1   | 2   | 11  |       | 3     | 3       | 3   | 2   | 2   |     | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Arkansas         | 2016-01-02 |     | 29:00  | 2   | 4   |     | 1    |     |     | 4   |       | 2     | 2       | 8   | 1   | 2   |     |       | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Arkansas         | 2016-01-02 |     | 28:00  | 4   | 9   | 2   | 4    | 4   | 5   | 14  |       | 3     | 3       | 4   | 3   | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Arkansas         | 2016-01-02 |     | 26:00  | 9   | 13  | 4   | 6    | 6   | 7   | 28  |       | 7     | 7       |     | 1   | 2   |     | 2     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Arkansas         | 2016-01-02 |     | 19:00  |     | 3   |     |      | 4   | 10  | 4   | 3     | 3     | 6       | 2   | 1   | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Arkansas         | 2016-01-02 |     | 16:00  | 3   | 5   | 2   | 4    | 2   | 2   | 10  |       |       |         | 1   |     |     |     | 3     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Arkansas         | 2016-01-02 |     | 19:00  | 3   | 10  | 1   | 7    |     |     | 7   | 1     | 1     | 2       | 1   |     | 2   |     |       | Reed Arena (College Station, TX)         |
| Byers, Frank          | Texas A&M | Arkansas         | 2016-01-02 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Arkansas         | 2016-01-02 |     | 1:00   |     | 1   |     | 1    |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Arkansas         | 2016-01-02 |     | 1:00   | 1   | 2   |     |      |     |     | 2   |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | Arkansas         | 2016-01-02 |     | 1:00   |     |     |     |      |     |     |     |       | 1     | 1       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Arkansas         | 2016-01-02 |     | 11:00  | 1   | 2   |     |      |     |     | 2   | 1     | 2     | 3       |     | 2   | 1   | 1   | 5/    | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Arkansas         | 2016-01-02 |     | 22:00  | 5   | 11  |     | 1    |     |     | 10  | 5     | 5     | 10      | 1   |     |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Mississippi St.  | 2016-01-06 | G   | 37:00  | 3   | 6   | 3   | 5    | 2   | 2   | 11  | 4     | 3     | 7       | 8   | 1   |     |     | 1     | Starkville, Miss. (Humphrey Coliseum)    |
| Collins, Anthony      | Texas A&M | Mississippi St.  | 2016-01-06 | G   | 30:00  | 2   | 3   | 2   | 3    | 1   | 1   | 7   | 1     |       | 1       | 4   | 2   | 2   |     | 2     | Starkville, Miss. (Humphrey Coliseum)    |
| Hogg, DJ              | Texas A&M | Mississippi St.  | 2016-01-06 | F   | 32:00  | 4   | 12  | 3   | 10   |     |     | 11  | 3     | 6     | 9       | 1   | 1   |     |     | 1     | Starkville, Miss. (Humphrey Coliseum)    |
| Jones, Jalen          | Texas A&M | Mississippi St.  | 2016-01-06 | G   | 32:00  | 3   | 13  |     | 2    | 5   | 6   | 11  | 3     | 5     | 8       |     | 2   | 1   |     | 3     | Starkville, Miss. (Humphrey Coliseum)    |
| Davis, Tyler          | Texas A&M | Mississippi St.  | 2016-01-06 | C   | 17:00  | 1   | 6   |     |      | 2   | 2   | 4   | 4     |       | 4       |     | 1   |     |     | 2     | Starkville, Miss. (Humphrey Coliseum)    |
| Gilder, Admon         | Texas A&M | Mississippi St.  | 2016-01-06 |     | 25:00  | 3   | 12  | 1   | 7    | 3   | 4   | 10  | 1     | 3     | 4       | 2   |     | 2   |     | 2     | Starkville, Miss. (Humphrey Coliseum)    |
| Miller, Tavario       | Texas A&M | Mississippi St.  | 2016-01-06 |     | 11:00  |     | 1   |     |      |     | 2   |     | 2     | 3     | 5       |     | 1   |     |     | 2     | Starkville, Miss. (Humphrey Coliseum)    |
| Trocha-Morelos, Tonny | Texas A&M | Mississippi St.  | 2016-01-06 |     | 16:00  | 3   | 9   |     |      | 1   | 2   | 7   |       | 1     | 1       |     | 2   |     |     |       | Starkville, Miss. (Humphrey Coliseum)    |
| Caruso, Alex          | Texas A&M | Tennessee        | 2016-01-09 | G   | 37:00  | 3   | 4   | 3   | 4    | 4   | 6   | 13  | 1     | 4     | 5       | 7   | 3   | 5   |     | 3     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Collins, Anthony      | Texas A&M | Tennessee        | 2016-01-09 | G   | 26:00  | 1   | 1   | 1   | 1    | 2   | 2   | 5   | 1     | 2     | 3       | 9   |     | 1   |     | 4     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Davis, Tyler          | Texas A&M | Tennessee        | 2016-01-09 | C   | 25:00  | 4   | 10  |     |      | 3   | 6   | 11  | 4     | 2     | 6       |     | 3   |     | 1   | 3     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Hogg, DJ              | Texas A&M | Tennessee        | 2016-01-09 | F   | 16:00  | 1   | 4   | 1   | 4    |     |     | 3   |       | 1     | 1       | 2   |     |     |     | 1     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Jones, Jalen          | Texas A&M | Tennessee        | 2016-01-09 | F   | 29:00  | 10  | 15  |     |      | 7   | 7   | 27  | 2     | 5     | 7       | 1   | 2   | 2   | 1   | 4     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Gilder, Admon         | Texas A&M | Tennessee        | 2016-01-09 |     | 15:00  | 1   | 3   | 1   | 2    |     |     | 3   |       |       |         | 1   | 3   |     |     |       | Knoxville, Tenn. (Thompson-Boling Arena) |
| House, Danuel         | Texas A&M | Tennessee        | 2016-01-09 |     | 32:00  | 8   | 15  | 2   | 7    | 5   | 7   | 23  | 2     | 3     | 5       | 1   | 1   | 2   |     | 3     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Miller, Tavario       | Texas A&M | Tennessee        | 2016-01-09 |     | 7:00   | 1   | 3   |     |      |     |     | 2   | 2     | 1     | 3       |     | 2   | 1   |     | 2     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Trocha-Morelos, Tonny | Texas A&M | Tennessee        | 2016-01-09 |     | 13:00  | 2   | 7   | 1   | 3    |     |     | 5   | 1     | 2     | 3       |     |     |     | 1   | 1     | Knoxville, Tenn. (Thompson-Boling Arena) |
| Caruso, Alex          | Texas A&M | Florida          | 2016-01-12 |     | 33:00  | 2   | 6   | 1   | 2    |     | 2   | 5   | 2     | 5     | 7       | 7   | 1   | 2   | 2   | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Florida          | 2016-01-12 |     | 30:00  |     | 1   |     | 1    | 4   | 4   | 4   |       | 1     | 1       | 3   |     | 1   |     | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Florida          | 2016-01-12 |     | 31:00  | 7   | 24  | 2   | 10   | 6   | 6   | 22  | 3     | 2     | 5       | 3   | 1   |     | 1   |       | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Florida          | 2016-01-12 |     | 32:00  | 8   | 13  | 3   | 4    | 7   | 11  | 26  | 3     | 3     | 6       |     | 1   |     | 1   | 3     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Florida          | 2016-01-12 |     | 25:00  | 3   | 7   |     |      | 2   | 5   | 8   | 2     | 3     | 5       |     | 1   | 3   |     | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Florida          | 2016-01-12 |     | 13:00  |     | 5   |     | 3    |     |     |     | 1     |       | 1       | 1   |     | 1   |     |       | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Florida          | 2016-01-12 |     | 13:00  | 1   | 3   | 1   | 2    |     |     | 3   |       | 3     | 3       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Florida          | 2016-01-12 |     | 12:00  | 1   | 1   |     |      | 1   | 2   | 3   | 1     | 5     | 6       |     | 3   |     |     | 3     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Florida          | 2016-01-12 |     | 11:00  |     | 1   |     | 1    |     |     |     | 2     | 1     | 3       |     |     |     | 2   | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Georgia          | 2016-01-16 | G   | 28:00  | 5   | 6   | 2   | 2    |     |     | 12  |       |       |         | 4   | 1   |     |     | 1     | Stegeman Coliseum -- Athens, Ga.         |
| Collins, Anthony      | Texas A&M | Georgia          | 2016-01-16 | G   | 23:00  | 3   | 3   | 1   | 1    | 2   | 2   | 9   |       | 2     | 2       | 4   | 2   |     |     | 1     | Stegeman Coliseum -- Athens, Ga.         |
| House, Danuel         | Texas A&M | Georgia          | 2016-01-16 | G   | 23:00  | 3   | 7   | 2   | 4    | 4   | 5   | 12  |       | 1     | 1       | 2   |     |     |     | 1     | Stegeman Coliseum -- Athens, Ga.         |
| Jones, Jalen          | Texas A&M | Georgia          | 2016-01-16 | G   | 26:00  | 4   | 13  | 1   | 3    | 3   | 6   | 12  | 4     | 8     | 12      | 1   |     | 1   | 1   | 2     | Stegeman Coliseum -- Athens, Ga.         |
| Davis, Tyler          | Texas A&M | Georgia          | 2016-01-16 | C   | 19:00  | 4   | 4   |     |      | 1   | 1   | 9   | 1     | 3     | 4       |     | 3   | 1   | 2   | 4     | Stegeman Coliseum -- Athens, Ga.         |
| Gilder, Admon         | Texas A&M | Georgia          | 2016-01-16 |     | 23:00  | 1   | 4   |     | 2    |     | 1   | 2   |       | 5     | 5       | 4   |     | 5   |     | 1     | Stegeman Coliseum -- Athens, Ga.         |
| Hogg, DJ              | Texas A&M | Georgia          | 2016-01-16 |     | 16:00  | 2   | 7   | 2   | 5    |     |     | 6   |       | 4     | 4       |     | 1   |     |     | 2     | Stegeman Coliseum -- Athens, Ga.         |
| Byers, Frank          | Texas A&M | Georgia          | 2016-01-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Stegeman Coliseum -- Athens, Ga.         |
| Aparicio, Juan        | Texas A&M | Georgia          | 2016-01-16 |     | 3:00   | 1   | 1   | 1   | 1    |     |     | 3   |       |       |         | 1   |     |     |     | 1     | Stegeman Coliseum -- Athens, Ga.         |
| Eubanks, Kobie        | Texas A&M | Georgia          | 2016-01-16 |     | 4:00   | 1   | 1   | 1   | 1    |     |     | 3   |       | 1     | 1       | 1   | 1   |     |     |       | Stegeman Coliseum -- Athens, Ga.         |
| Dobbins, Kyle         | Texas A&M | Georgia          | 2016-01-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         | 1   |     |     |     |       | Stegeman Coliseum -- Athens, Ga.         |
| Distefano, TJ         | Texas A&M | Georgia          | 2016-01-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Stegeman Coliseum -- Athens, Ga.         |
| Miller, Tavario       | Texas A&M | Georgia          | 2016-01-16 |     | 14:00  | 1   | 1   |     |      |     |     | 2   |       | 1     | 1       | 1   | 2   |     |     | 5/    | Stegeman Coliseum -- Athens, Ga.         |
| Trocha-Morelos, Tonny | Texas A&M | Georgia          | 2016-01-16 |     | 18:00  | 4   | 8   | 1   | 3    |     |     | 9   | 1     | 2     | 3       | 2   |     | 2   |     | 2     | Stegeman Coliseum -- Athens, Ga.         |
| Caruso, Alex          | Texas A&M | LSU              | 2016-01-19 |     | 20:00  | 1   | 4   |     | 2    | 3   | 4   | 5   | 1     | 3     | 4       | 4   | 5   | 3   |     | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | LSU              | 2016-01-19 |     | 34:00  |     | 2   |     | 2    |     |     |     |       |       |         | 6   | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | LSU              | 2016-01-19 |     | 32:00  | 2   | 9   | 1   | 5    |     |     | 5   | 1     | 9     | 10      | 6   | 5   |     |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | LSU              | 2016-01-19 |     | 27:00  | 9   | 14  | 1   | 4    | 1   | 3   | 20  |       | 6     | 6       |     | 3   | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | LSU              | 2016-01-19 |     | 29:00  | 7   | 9   |     |      | 4   | 6   | 18  | 4     | 1     | 5       | 1   |     | 1   | 1   | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | LSU              | 2016-01-19 |     | 21:00  | 5   | 8   | 3   | 5    |     |     | 13  |       | 1     | 1       |     | 1   | 2   |     | 1     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | LSU              | 2016-01-19 |     | 15:00  | 2   | 5   | 1   | 4    | 1   | 2   | 6   | 1     | 3     | 4       | 2   |     | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | LSU              | 2016-01-19 |     | 14:00  | 1   | 2   |     |      |     |     | 2   | 1     | 4     | 5       | 1   | 1   | 1   | 1   | 1     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | LSU              | 2016-01-19 |     | 8:00   | 1   | 5   |     | 3    |     |     | 2   |       | 1     | 1       | 1   |     |     |     |       | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Missouri         | 2016-01-23 |     | 27:00  | 3   | 7   |     | 2    |     |     | 6   | 2     | 2     | 4       | 5   | 1   | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Missouri         | 2016-01-23 |     | 22:00  |     |     |     |      |     |     |     |       | 1     | 1       | 3   | 2   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Missouri         | 2016-01-23 |     | 36:00  | 6   | 16  | 4   | 12   | 1   | 2   | 17  |       | 5     | 5       | 7   |     |     |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Missouri         | 2016-01-23 |     | 27:00  | 5   | 14  | 1   | 4    | 9   | 11  | 20  | 2     | 3     | 5       | 1   |     | 1   |     | 4     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Missouri         | 2016-01-23 |     | 21:00  | 1   | 4   |     |      |     | 2   | 2   | 2     | 8     | 10      |     | 1   |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Missouri         | 2016-01-23 |     | 19:00  | 2   | 7   | 1   | 5    |     | 3   | 5   |       | 2     | 2       |     | 1   |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Missouri         | 2016-01-23 |     | 19:00  | 2   | 6   | 1   | 5    | 4   | 4   | 9   | 1     | 1     | 2       | 1   |     |     |     |       | Reed Arena (College Station, TX)         |
| Byers, Frank          | Texas A&M | Missouri         | 2016-01-23 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Missouri         | 2016-01-23 |     | 1:00   |     | 1   |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Eubanks, Kobie        | Texas A&M | Missouri         | 2016-01-23 |     | 2:00   |     |     |     |      |     |     |     |       | 1     | 1       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Missouri         | 2016-01-23 |     | 1:00   |     |     |     |      | 1   | 2   | 1   |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | Missouri         | 2016-01-23 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Missouri         | 2016-01-23 |     | 23:00  | 3   | 6   |     |      |     | 2   | 6   | 4     | 3     | 7       |     |     | 1   | 1   | 2     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Arkansas         | 2016-01-27 | G   | 19:00  | 3   | 9   |     | 3    | 4   | 5   | 10  | 1     | 2     | 3       | 5   | 4   | 1   |     | 4     | Fayetteville, Ark. (Bud Walton Arena)    |
| Collins, Anthony      | Texas A&M | Arkansas         | 2016-01-27 | G   | 32:00  | 1   | 4   |     | 1    |     |     | 2   |       | 1     | 1       | 1   | 3   |     |     | 1     | Fayetteville, Ark. (Bud Walton Arena)    |
| House, Danuel         | Texas A&M | Arkansas         | 2016-01-27 | G   | 34:00  | 7   | 12  | 4   | 5    | 6   | 9   | 24  | 3     | 3     | 6       | 1   | 3   | 3   |     | 1     | Fayetteville, Ark. (Bud Walton Arena)    |
| Jones, Jalen          | Texas A&M | Arkansas         | 2016-01-27 | F   | 28:00  | 2   | 7   |     | 2    | 6   | 6   | 10  | 2     | 8     | 10      | 2   | 5   |     | 1   | 5/    | Fayetteville, Ark. (Bud Walton Arena)    |
| Davis, Tyler          | Texas A&M | Arkansas         | 2016-01-27 | C   | 26:00  | 3   | 6   |     |      | 8   | 9   | 14  | 4     | 4     | 8       |     | 2   | 1   | 1   | 4     | Fayetteville, Ark. (Bud Walton Arena)    |
| Gilder, Admon         | Texas A&M | Arkansas         | 2016-01-27 |     | 24:00  | 1   | 2   | 1   | 1    |     |     | 3   |       | 5     | 5       | 1   | 3   |     |     | 3     | Fayetteville, Ark. (Bud Walton Arena)    |
| Hogg, DJ              | Texas A&M | Arkansas         | 2016-01-27 |     | 13:00  | 1   | 4   |     | 1    | 1   | 2   | 3   | 1     | 1     | 2       |     |     |     |     | 2     | Fayetteville, Ark. (Bud Walton Arena)    |
| Miller, Tavario       | Texas A&M | Arkansas         | 2016-01-27 |     | 9:00   | 1   | 3   |     |      | 2   | 2   | 4   | 1     | 4     | 5       |     |     |     |     | 3     | Fayetteville, Ark. (Bud Walton Arena)    |
| Trocha-Morelos, Tonny | Texas A&M | Arkansas         | 2016-01-27 |     | 15:00  |     | 1   |     |      | 1   | 2   | 1   |       | 2     | 2       |     |     | 1   |     | 2     | Fayetteville, Ark. (Bud Walton Arena)    |
| Caruso, Alex          | Texas A&M | Iowa St.         | 2016-01-30 |     | 33:00  | 3   | 7   |     | 3    | 3   | 3   | 9   |       | 6     | 6       | 6   | 4   | 2   |     | 1     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Iowa St.         | 2016-01-30 |     | 30:00  |     | 2   |     | 1    | 1   | 3   | 1   |       | 1     | 1       | 5   | 2   |     |     | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Iowa St.         | 2016-01-30 |     | 32:00  | 7   | 13  | 1   | 4    | 5   | 9   | 20  |       | 2     | 2       | 2   | 2   |     |     | 2     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Iowa St.         | 2016-01-30 |     | 33:00  | 5   | 19  |     | 5    | 3   | 4   | 13  | 2     | 12    | 14      | 1   |     |     |     | 4     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Iowa St.         | 2016-01-30 |     | 22:00  | 6   | 8   |     |      | 3   | 4   | 15  | 4     | 2     | 6       |     | 1   | 1   |     | 4     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Iowa St.         | 2016-01-30 |     | 12:00  |     | 3   |     | 1    |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Iowa St.         | 2016-01-30 |     | 20:00  | 2   | 5   | 2   | 4    |     |     | 6   | 1     | 3     | 4       | 1   |     |     |     | 3     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Iowa St.         | 2016-01-30 |     | 18:00  | 3   | 5   | 2   | 3    |     |     | 8   | 2     | 3     | 5       | 1   |     |     | 1   | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Vanderbilt       | 2016-02-04 | G   | 28:00  | 5   | 7   |     | 2    | 1   | 2   | 11  |       | 2     | 2       | 4   |     | 4   |     | 1     | Nashville, Tenn. (Memorial Gym)          |
| Collins, Anthony      | Texas A&M | Vanderbilt       | 2016-02-04 | G   | 19:00  | 1   | 2   |     |      |     |     | 2   |       |       |         | 1   | 2   |     |     | 2     | Nashville, Tenn. (Memorial Gym)          |
| House, Danuel         | Texas A&M | Vanderbilt       | 2016-02-04 | G   | 35:00  | 2   | 8   | 2   | 7    | 4   | 7   | 10  | 1     | 4     | 5       | 1   | 1   |     |     |       | Nashville, Tenn. (Memorial Gym)          |
| Jones, Jalen          | Texas A&M | Vanderbilt       | 2016-02-04 | F   | 22:00  | 1   | 13  | 1   | 3    | 1   | 2   | 4   | 2     | 4     | 6       | 1   | 1   | 2   |     | 1     | Nashville, Tenn. (Memorial Gym)          |
| Davis, Tyler          | Texas A&M | Vanderbilt       | 2016-02-04 | C   | 25:00  | 3   | 6   |     |      |     |     | 6   | 1     | 2     | 3       |     | 1   |     |     |       | Nashville, Tenn. (Memorial Gym)          |
| Gilder, Admon         | Texas A&M | Vanderbilt       | 2016-02-04 |     | 22:00  | 3   | 6   | 1   | 3    | 1   | 1   | 8   |       | 1     | 1       | 3   |     |     | 1   | 1     | Nashville, Tenn. (Memorial Gym)          |
| Hogg, DJ              | Texas A&M | Vanderbilt       | 2016-02-04 |     | 19:00  | 2   | 5   | 1   | 3    | 1   | 1   | 6   | 1     |       | 1       | 1   | 1   | 1   |     | 2     | Nashville, Tenn. (Memorial Gym)          |
| Eubanks, Kobie        | Texas A&M | Vanderbilt       | 2016-02-04 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Nashville, Tenn. (Memorial Gym)          |
| Miller, Tavario       | Texas A&M | Vanderbilt       | 2016-02-04 |     | 11:00  |     | 1   |     |      |     |     |     | 1     | 2     | 3       |     |     |     |     |       | Nashville, Tenn. (Memorial Gym)          |
| Trocha-Morelos, Tonny | Texas A&M | Vanderbilt       | 2016-02-04 |     | 18:00  | 4   | 9   | 2   | 4    | 3   | 4   | 13  | 1     | 3     | 4       |     |     | 1   | 2   | 3     | Nashville, Tenn. (Memorial Gym)          |
| Caruso, Alex          | Texas A&M | South Carolina   | 2016-02-06 |     | 32:00  | 5   | 7   | 2   | 2    | 4   | 5   | 16  | 1     | 3     | 4       | 8   | 3   | 3   | 1   | 1     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | South Carolina   | 2016-02-06 |     | 29:00  | 3   | 10  | 2   | 5    | 1   | 1   | 9   |       |       |         | 7   | 1   |     |     | 3     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | South Carolina   | 2016-02-06 |     | 34:00  | 6   | 12  | 4   | 10   |     |     | 16  |       | 3     | 3       | 2   | 5   |     | 1   | 3     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | South Carolina   | 2016-02-06 |     | 23:00  | 4   | 7   | 2   | 4    | 4   | 7   | 14  |       | 5     | 5       |     | 4   |     |     | 5/    | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | South Carolina   | 2016-02-06 |     | 22:00  | 2   | 5   |     |      | 3   | 4   | 7   | 3     |       | 3       |     | 2   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | South Carolina   | 2016-02-06 |     | 13:00  | 2   | 5   | 1   | 2    |     |     | 5   | 1     |       | 1       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | South Carolina   | 2016-02-06 |     | 24:00  | 3   | 5   | 1   | 1    |     | 1   | 7   | 2     | 5     | 7       | 2   |     | 1   | 1   |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | South Carolina   | 2016-02-06 |     | 9:00   |     |     |     |      | 2   | 4   | 2   | 1     | 3     | 4       |     | 1   |     |     | 3     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | South Carolina   | 2016-02-06 |     | 14:00  | 1   | 2   |     | 1    |     |     | 2   |       | 1     | 1       |     | 1   |     | 1   | 3     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Alabama          | 2016-02-10 | G   | 30:00  | 1   | 2   |     |      |     |     | 2   | 1     | 2     | 3       | 3   | 6   | 3   | 1   | 4     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Collins, Anthony      | Texas A&M | Alabama          | 2016-02-10 | G   | 30:00  | 3   | 8   | 3   | 5    | 2   | 4   | 11  |       | 1     | 1       | 5   | 1   | 1   |     | 2     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Davis, Tyler          | Texas A&M | Alabama          | 2016-02-10 | C   | 25:00  | 3   | 5   |     |      |     |     | 6   | 2     | 3     | 5       |     | 2   |     |     | 2     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| House, Danuel         | Texas A&M | Alabama          | 2016-02-10 | G   | 34:00  | 3   | 7   | 1   | 4    | 5   | 8   | 12  | 1     | 7     | 8       |     | 3   |     |     | 1     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Jones, Jalen          | Texas A&M | Alabama          | 2016-02-10 | F   | 35:00  | 6   | 13  | 2   | 3    | 7   | 8   | 21  | 3     | 4     | 7       |     |     | 1   | 1   | 3     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Gilder, Admon         | Texas A&M | Alabama          | 2016-02-10 |     | 13:00  | 1   | 2   |     | 1    | 2   | 3   | 4   |       |       |         |     | 1   |     |     | 2     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Hogg, DJ              | Texas A&M | Alabama          | 2016-02-10 |     | 13:00  |     | 2   |     |      |     |     |     |       |       |         |     |     | 1   |     |       | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Miller, Tavario       | Texas A&M | Alabama          | 2016-02-10 |     | 4:00   |     | 1   |     |      |     |     |     |       | 1     | 1       |     |     |     |     |       | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Trocha-Morelos, Tonny | Texas A&M | Alabama          | 2016-02-10 |     | 16:00  | 2   | 5   | 2   | 4    |     |     | 6   |       | 2     | 2       |     |     |     |     | 4     | Tuscaloosa, Ala. (Coleman Coliseum)      |
| Caruso, Alex          | Texas A&M | LSU              | 2016-02-13 | G   | 32:00  | 5   | 11  | 2   | 4    | 2   | 2   | 14  |       |       |         | 3   | 4   | 3   | 1   | 4     | Baton Rouge, La. (Maravich Center)       |
| Collins, Anthony      | Texas A&M | LSU              | 2016-02-13 | G   | 5:00   |     |     |     |      |     |     |     |       | 1     | 1       | 1   | 2   |     |     | 2     | Baton Rouge, La. (Maravich Center)       |
| House, Danuel         | Texas A&M | LSU              | 2016-02-13 | G   | 39:00  | 9   | 14  | 1   | 4    | 1   | 1   | 20  | 1     | 3     | 4       | 2   | 4   |     |     | 2     | Baton Rouge, La. (Maravich Center)       |
| Trocha-Morelos, Tonny | Texas A&M | LSU              | 2016-02-13 | C   | 18:00  | 1   | 5   | 1   | 4    |     |     | 3   |       | 4     | 4       |     |     |     |     | 2     | Baton Rouge, La. (Maravich Center)       |
| Davis, Tyler          | Texas A&M | LSU              | 2016-02-13 | C   | 24:00  | 4   | 4   |     |      | 1   | 1   | 9   | 2     | 4     | 6       | 1   | 5   |     | 1   | 3     | Baton Rouge, La. (Maravich Center)       |
| Gilder, Admon         | Texas A&M | LSU              | 2016-02-13 |     | 23:00  | 5   | 6   | 1   | 2    |     | 1   | 11  | 1     |       | 1       | 1   |     |     |     | 4     | Baton Rouge, La. (Maravich Center)       |
| Hogg, DJ              | Texas A&M | LSU              | 2016-02-13 |     | 22:00  |     | 1   |     | 1    |     |     |     | 1     | 5     | 6       | 2   | 2   | 1   |     |       | Baton Rouge, La. (Maravich Center)       |
| Jones, Jalen          | Texas A&M | LSU              | 2016-02-13 |     | 27:00  | 4   | 9   | 2   | 5    | 2   | 2   | 12  |       | 1     | 1       |     | 2   |     |     | 3     | Baton Rouge, La. (Maravich Center)       |
| Dobbins, Kyle         | Texas A&M | LSU              | 2016-02-13 |     |        |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Baton Rouge, La. (Maravich Center)       |
| Miller, Tavario       | Texas A&M | LSU              | 2016-02-13 |     | 10:00  | 1   | 2   |     |      |     |     | 2   | 1     | 3     | 4       | 1   |     |     | 1   | 3     | Baton Rouge, La. (Maravich Center)       |
| Caruso, Alex          | Texas A&M | Ole Miss         | 2016-02-16 |     | 32:00  | 2   | 5   |     |      |     |     | 4   | 2     | 1     | 3       | 2   | 2   | 1   | 2   | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Ole Miss         | 2016-02-16 |     | 33:00  | 4   | 7   |     | 1    | 2   | 3   | 10  |       | 6     | 6       | 8   | 3   | 2   | 1   | 3     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Ole Miss         | 2016-02-16 |     | 33:00  | 4   | 12  | 2   | 6    | 3   | 3   | 13  | 2     | 5     | 7       | 2   | 1   |     | 2   | 1     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Ole Miss         | 2016-02-16 |     | 22:00  | 3   | 11  |     | 3    |     |     | 6   | 1     | 8     | 9       |     | 1   |     |     | 4     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Ole Miss         | 2016-02-16 |     | 19:00  | 4   | 7   |     |      | 3   | 4   | 11  | 1     | 6     | 7       | 1   | 1   |     | 1   | 1     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Ole Miss         | 2016-02-16 |     | 16:00  | 2   | 6   |     | 3    | 3   | 3   | 7   |       | 3     | 3       | 1   |     |     |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Ole Miss         | 2016-02-16 |     | 16:00  | 4   | 8   | 2   | 5    |     |     | 10  |       | 1     | 1       |     |     |     |     | 1     | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Ole Miss         | 2016-02-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Ole Miss         | 2016-02-16 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Ole Miss         | 2016-02-16 |     | 13:00  | 1   | 1   |     |      | 2   | 4   | 4   | 3     | 5     | 8       | 1   | 1   |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Ole Miss         | 2016-02-16 |     | 14:00  | 2   | 4   |     | 1    | 2   | 2   | 6   | 1     | 1     | 2       | 1   |     |     | 1   |       | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Kentucky         | 2016-02-20 |     | 36:00  | 4   | 8   | 1   | 3    | 1   | 1   | 10  | 1     | 1     | 2       | 3   | 2   | 1   |     | 3     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Kentucky         | 2016-02-20 |     | 32:00  | 1   | 7   |     | 1    |     |     | 2   |       |       |         | 8   |     | 1   | 1   | 3     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Kentucky         | 2016-02-20 |     | 35:00  | 2   | 13  | 1   | 4    | 4   | 4   | 9   |       | 3     | 3       | 3   | 1   | 1   |     |       | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Kentucky         | 2016-02-20 |     | 34:00  | 9   | 19  | 4   | 8    | 2   | 5   | 24  | 1     | 7     | 8       |     |     | 2   |     | 1     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Kentucky         | 2016-02-20 |     | 28:00  | 5   | 9   |     |      | 5   | 10  | 15  | 9     | 3     | 12      |     | 1   |     |     | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Kentucky         | 2016-02-20 |     | 18:00  | 1   | 5   |     | 2    |     | 2   | 2   | 2     |       | 2       | 1   | 1   |     |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Kentucky         | 2016-02-20 |     | 20:00  | 4   | 8   | 2   | 5    |     |     | 10  |       | 1     | 1       |     | 1   |     |     | 1     | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Kentucky         | 2016-02-20 |     | 8:00   |     | 1   |     |      |     |     |     | 1     | 2     | 3       |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Kentucky         | 2016-02-20 |     | 14:00  | 2   | 2   | 1   | 1    | 2   | 2   | 7   | 4     | 2     | 6       | 3   | 1   |     |     | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Mississippi St.  | 2016-02-24 |     | 32:00  | 4   | 9   | 1   | 3    |     |     | 9   |       | 1     | 1       | 6   |     | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Mississippi St.  | 2016-02-24 |     | 23:00  | 1   | 2   | 1   | 1    |     |     | 3   |       | 3     | 3       | 5   | 1   | 1   | 1   |       | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Mississippi St.  | 2016-02-24 |     | 30:00  | 4   | 13  | 2   | 6    | 6   | 8   | 16  |       | 2     | 2       | 3   |     | 1   |     | 4     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Mississippi St.  | 2016-02-24 |     | 26:00  | 2   | 8   |     | 2    | 2   | 5   | 6   |       | 8     | 8       | 1   | 2   |     |     |       | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Mississippi St.  | 2016-02-24 |     | 29:00  | 6   | 8   |     |      | 3   | 5   | 15  | 5     | 1     | 6       | 1   | 3   | 1   | 2   | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Mississippi St.  | 2016-02-24 |     | 18:00  | 1   | 3   | 1   | 2    |     |     | 3   |       | 3     | 3       | 1   |     | 1   | 1   |       | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Mississippi St.  | 2016-02-24 |     | 18:00  | 4   | 9   | 2   | 6    |     |     | 10  |       | 1     | 1       |     |     | 1   |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Mississippi St.  | 2016-02-24 |     | 11:00  |     | 1   |     |      |     | 2   |     | 2     |       | 2       |     | 2   | 1   | 1   | 2     | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Mississippi St.  | 2016-02-24 |     | 13:00  | 3   | 4   |     | 1    |     |     | 6   | 2     | 1     | 3       |     | 2   | 1   | 1   | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Missouri         | 2016-02-27 | G   | 20:00  | 1   | 2   | 1   | 2    |     |     | 3   |       | 2     | 2       | 6   | 1   | 1   |     | 1     | Columbia, Mo. // Mizzou Arena            |
| Collins, Anthony      | Texas A&M | Missouri         | 2016-02-27 | G   | 14:00  |     |     |     |      |     |     |     |       |       |         | 3   | 1   | 1   |     | 3     | Columbia, Mo. // Mizzou Arena            |
| Davis, Tyler          | Texas A&M | Missouri         | 2016-02-27 | C   | 21:00  | 4   | 6   |     |      |     |     | 8   | 2     | 5     | 7       | 1   | 2   |     | 2   | 4     | Columbia, Mo. // Mizzou Arena            |
| House, Danuel         | Texas A&M | Missouri         | 2016-02-27 | G   | 24:00  | 5   | 11  | 4   | 8    |     |     | 14  |       | 2     | 2       | 1   |     |     |     |       | Columbia, Mo. // Mizzou Arena            |
| Jones, Jalen          | Texas A&M | Missouri         | 2016-02-27 | F   | 23:00  | 8   | 14  |     | 4    | 4   | 5   | 20  | 2     | 4     | 6       |     |     |     |     | 1     | Columbia, Mo. // Mizzou Arena            |
| Aparicio, Juan        | Texas A&M | Missouri         | 2016-02-27 |     | 2:00   |     |     |     |      |     |     |     |       |       |         |     | 1   |     |     |       | Columbia, Mo. // Mizzou Arena            |
| Byers, Frank          | Texas A&M | Missouri         | 2016-02-27 |     | 2:00   |     | 1   |     | 1    |     |     |     |       |       |         |     |     |     |     |       | Columbia, Mo. // Mizzou Arena            |
| Distefano, TJ         | Texas A&M | Missouri         | 2016-02-27 |     | 2:00   |     | 1   |     | 1    |     |     |     |       |       |         |     |     |     |     | 1     | Columbia, Mo. // Mizzou Arena            |
| Dobbins, Kyle         | Texas A&M | Missouri         | 2016-02-27 |     | 2:00   |     |     |     |      |     | 1   |     |       |       |         |     |     |     |     |       | Columbia, Mo. // Mizzou Arena            |
| Eubanks, Kobie        | Texas A&M | Missouri         | 2016-02-27 |     | 11:00  |     | 3   |     | 3    |     |     |     |       |       |         | 1   |     | 3   |     |       | Columbia, Mo. // Mizzou Arena            |
| Gilder, Admon         | Texas A&M | Missouri         | 2016-02-27 |     | 26:00  | 5   | 6   | 2   | 3    | 2   | 2   | 14  | 1     | 3     | 4       | 3   |     | 3   |     | 2     | Columbia, Mo. // Mizzou Arena            |
| Hogg, DJ              | Texas A&M | Missouri         | 2016-02-27 |     | 19:00  | 2   | 5   | 1   | 4    | 4   | 4   | 9   |       | 2     | 2       | 2   |     |     |     |       | Columbia, Mo. // Mizzou Arena            |
| Miller, Tavario       | Texas A&M | Missouri         | 2016-02-27 |     | 16:00  | 1   | 2   |     |      | 2   | 2   | 4   | 1     | 4     | 5       | 1   | 1   |     | 1   | 3     | Columbia, Mo. // Mizzou Arena            |
| Trocha-Morelos, Tonny | Texas A&M | Missouri         | 2016-02-27 |     | 18:00  | 5   | 9   | 1   | 4    | 1   | 2   | 12  | 1     | 3     | 4       | 1   |     |     |     | 1     | Columbia, Mo. // Mizzou Arena            |
| Caruso, Alex          | Texas A&M | Auburn           | 2016-03-01 | G   | 26:00  | 1   | 6   |     |      | 3   | 3   | 5   |       | 9     | 9       | 7   | 1   | 2   |     | 4     | Auburn Arena -- Auburn, Ala.             |
| Collins, Anthony      | Texas A&M | Auburn           | 2016-03-01 | G   | 26:00  | 2   | 3   |     |      |     |     | 4   |       | 2     | 2       | 3   | 2   | 1   |     | 1     | Auburn Arena -- Auburn, Ala.             |
| Davis, Tyler          | Texas A&M | Auburn           | 2016-03-01 | C   | 26:00  | 4   | 8   |     |      | 6   | 7   | 14  | 6     | 3     | 9       |     | 3   |     |     | 2     | Auburn Arena -- Auburn, Ala.             |
| House, Danuel         | Texas A&M | Auburn           | 2016-03-01 | G   | 27:00  | 7   | 13  | 1   | 6    | 4   | 4   | 19  | 4     | 1     | 5       |     | 2   |     |     |       | Auburn Arena -- Auburn, Ala.             |
| Jones, Jalen          | Texas A&M | Auburn           | 2016-03-01 | F   | 28:00  | 6   | 15  |     | 3    | 4   | 4   | 16  | 3     | 5     | 8       |     | 1   | 1   |     | 3     | Auburn Arena -- Auburn, Ala.             |
| Eubanks, Kobie        | Texas A&M | Auburn           | 2016-03-01 |     | 3:00   |     | 1   |     |      |     |     |     | 1     |       | 1       |     |     |     |     | 1     | Auburn Arena -- Auburn, Ala.             |
| Gilder, Admon         | Texas A&M | Auburn           | 2016-03-01 |     | 20:00  | 3   | 6   | 2   | 3    | 2   | 2   | 10  |       | 1     | 1       |     |     | 2   |     | 4     | Auburn Arena -- Auburn, Ala.             |
| Hogg, DJ              | Texas A&M | Auburn           | 2016-03-01 |     | 18:00  | 1   | 4   | 1   | 4    |     |     | 3   |       | 2     | 2       | 2   | 1   | 1   | 1   |       | Auburn Arena -- Auburn, Ala.             |
| Miller, Tavario       | Texas A&M | Auburn           | 2016-03-01 |     | 14:00  |     | 2   |     |      | 2   | 2   | 2   | 3     | 2     | 5       | 1   | 1   | 1   |     | 1     | Auburn Arena -- Auburn, Ala.             |
| Trocha-Morelos, Tonny | Texas A&M | Auburn           | 2016-03-01 |     | 12:00  | 2   | 7   | 1   | 4    | 3   | 4   | 8   | 2     | 2     | 4       |     | 2   |     |     | 2     | Auburn Arena -- Auburn, Ala.             |
| Caruso, Alex          | Texas A&M | Vanderbilt       | 2016-03-05 |     | 31:00  | 1   | 3   |     |      | 2   | 2   | 4   | 1     | 3     | 4       | 8   | 1   | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Collins, Anthony      | Texas A&M | Vanderbilt       | 2016-03-05 |     | 16:00  | 2   | 6   | 2   | 5    | 2   | 2   | 8   |       | 1     | 1       | 1   |     | 1   | 1   | 1     | Reed Arena (College Station, TX)         |
| House, Danuel         | Texas A&M | Vanderbilt       | 2016-03-05 |     | 31:00  | 4   | 14  |     | 6    | 3   | 6   | 11  | 3     | 1     | 4       | 3   | 2   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Jones, Jalen          | Texas A&M | Vanderbilt       | 2016-03-05 |     | 31:00  | 6   | 14  |     | 2    | 5   | 8   | 17  | 6     | 5     | 11      | 1   | 3   | 1   |     | 3     | Reed Arena (College Station, TX)         |
| Davis, Tyler          | Texas A&M | Vanderbilt       | 2016-03-05 |     | 21:00  | 6   | 9   |     |      | 4   | 5   | 16  | 2     | 3     | 5       | 2   |     |     | 3   | 3     | Reed Arena (College Station, TX)         |
| Gilder, Admon         | Texas A&M | Vanderbilt       | 2016-03-05 |     | 17:00  | 3   | 4   | 2   | 3    |     |     | 8   | 1     | 1     | 2       | 2   |     | 1   |     | 2     | Reed Arena (College Station, TX)         |
| Hogg, DJ              | Texas A&M | Vanderbilt       | 2016-03-05 |     | 27:00  | 2   | 6   | 2   | 3    |     |     | 6   |       |       |         | 2   |     |     | 1   | 2     | Reed Arena (College Station, TX)         |
| Aparicio, Juan        | Texas A&M | Vanderbilt       | 2016-03-05 |     |        |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Dobbins, Kyle         | Texas A&M | Vanderbilt       | 2016-03-05 |     |        |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Distefano, TJ         | Texas A&M | Vanderbilt       | 2016-03-05 |     |        |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Reed Arena (College Station, TX)         |
| Miller, Tavario       | Texas A&M | Vanderbilt       | 2016-03-05 |     | 6:00   | 1   | 1   |     |      |     |     | 2   |       | 1     | 1       |     |     | 1   |     |       | Reed Arena (College Station, TX)         |
| Trocha-Morelos, Tonny | Texas A&M | Vanderbilt       | 2016-03-05 |     | 20:00  | 2   | 5   |     | 1    |     |     | 4   | 2     | 3     | 5       | 2   | 1   | 1   |     | 1     | Reed Arena (College Station, TX)         |
| Caruso, Alex          | Texas A&M | Florida          | 2016-03-11 | G   | 30:00  | 3   | 5   |     |      | 2   | 2   | 8   | 2     | 1     | 3       | 5   | 2   | 3   | 2   | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Collins, Anthony      | Texas A&M | Florida          | 2016-03-11 | G   | 26:00  | 1   | 3   |     |      |     |     | 2   | 1     | 2     | 3       | 4   |     | 2   |     | 4     | 2016 SEC Men's Tournament-Nashville, TN  |
| House, Danuel         | Texas A&M | Florida          | 2016-03-11 | G   | 32:00  | 5   | 20  | 2   | 9    | 3   | 3   | 15  | 1     | 2     | 3       |     | 1   |     | 1   | 1     | 2016 SEC Men's Tournament-Nashville, TN  |
| Jones, Jalen          | Texas A&M | Florida          | 2016-03-11 | G   | 27:00  | 6   | 15  |     | 1    | 1   | 2   | 13  | 1     | 5     | 6       | 1   | 1   | 1   |     | 1     | 2016 SEC Men's Tournament-Nashville, TN  |
| Davis, Tyler          | Texas A&M | Florida          | 2016-03-11 | C   | 29:00  | 6   | 10  |     |      | 3   | 4   | 15  | 5     | 3     | 8       |     |     |     | 3   | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Gilder, Admon         | Texas A&M | Florida          | 2016-03-11 |     | 25:00  | 2   | 7   | 1   | 3    | 2   | 2   | 7   |       | 5     | 5       | 1   |     |     | 1   | 2     | 2016 SEC Men's Tournament-Nashville, TN  |
| Hogg, DJ              | Texas A&M | Florida          | 2016-03-11 |     | 9:00   |     | 1   |     | 1    |     |     |     | 1     |       | 1       |     | 2   | 1   |     | 1     | 2016 SEC Men's Tournament-Nashville, TN  |
| Miller, Tavario       | Texas A&M | Florida          | 2016-03-11 |     | 9:00   | 1   | 2   |     |      | 1   | 2   | 3   |       | 4     | 4       |     |     |     |     | 1     | 2016 SEC Men's Tournament-Nashville, TN  |
| Trocha-Morelos, Tonny | Texas A&M | Florida          | 2016-03-11 |     | 13:00  | 4   | 8   | 1   | 2    |     |     | 9   | 3     | 4     | 7       |     | 1   |     | 1   |       | 2016 SEC Men's Tournament-Nashville, TN  |
| Caruso, Alex          | Texas A&M | LSU              | 2016-03-12 | G   | 24:00  | 1   | 3   |     | 1    | 2   | 2   | 4   |       | 2     | 2       | 5   | 1   | 1   |     |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Collins, Anthony      | Texas A&M | LSU              | 2016-03-12 | G   | 25:00  | 1   | 4   | 1   | 3    |     |     | 3   |       | 2     | 2       | 3   | 1   | 1   |     | 3     | 2016 SEC Men's Basketball-Nashville, TN  |
| House, Danuel         | Texas A&M | LSU              | 2016-03-12 | G   | 19:00  | 2   | 8   |     | 4    |     |     | 4   | 1     | 6     | 7       | 1   |     |     | 1   | 1     | 2016 SEC Men's Basketball-Nashville, TN  |
| Jones, Jalen          | Texas A&M | LSU              | 2016-03-12 | G   | 18:00  | 5   | 9   | 1   | 2    | 1   | 2   | 12  | 3     | 3     | 6       |     | 3   |     |     | 3     | 2016 SEC Men's Basketball-Nashville, TN  |
| Davis, Tyler          | Texas A&M | LSU              | 2016-03-12 | C   | 22:00  | 3   | 6   |     |      |     | 1   | 6   | 2     | 2     | 4       |     | 1   |     | 3   |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Gilder, Admon         | Texas A&M | LSU              | 2016-03-12 |     | 27:00  | 3   | 5   | 1   | 3    | 3   | 3   | 10  |       | 4     | 4       | 1   | 2   |     |     | 1     | 2016 SEC Men's Basketball-Nashville, TN  |
| Hogg, DJ              | Texas A&M | LSU              | 2016-03-12 |     | 19:00  | 3   | 8   | 2   | 4    | 1   | 2   | 9   | 1     | 5     | 6       | 1   |     | 1   |     | 1     | 2016 SEC Men's Basketball-Nashville, TN  |
| Byers, Frank          | Texas A&M | LSU              | 2016-03-12 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Aparicio, Juan        | Texas A&M | LSU              | 2016-03-12 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Eubanks, Kobie        | Texas A&M | LSU              | 2016-03-12 |     | 9:00   | 2   | 4   | 2   | 4    |     |     | 6   | 1     | 6     | 7       |     |     |     |     | 1     | 2016 SEC Men's Basketball-Nashville, TN  |
| Dobbins, Kyle         | Texas A&M | LSU              | 2016-03-12 |     | 3:00   |     | 1   |     |      | 1   | 2   | 1   |       |       |         |     | 2   |     |     |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Distefano, TJ         | Texas A&M | LSU              | 2016-03-12 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | 2016 SEC Men's Basketball-Nashville, TN  |
| Miller, Tavario       | Texas A&M | LSU              | 2016-03-12 |     | 18:00  | 1   | 4   |     |      | 1   | 4   | 3   | 3     | 4     | 7       |     | 1   |     |     | 4     | 2016 SEC Men's Basketball-Nashville, TN  |
| Trocha-Morelos, Tonny | Texas A&M | LSU              | 2016-03-12 |     | 13:00  | 5   | 10  | 3   | 6    |     |     | 13  |       | 3     | 3       | 1   | 1   |     | 2   | 2     | 2016 SEC Men's Basketball-Nashville, TN  |
| Caruso, Alex          | Texas A&M | Kentucky         | 2016-03-13 | G   | 38:00  | 5   | 9   | 1   | 3    |     |     | 11  | 3     | 5     | 8       | 6   | 4   |     |     | 2     | 2016 SEC Men's Tournament-Nashville, TN  |
| Collins, Anthony      | Texas A&M | Kentucky         | 2016-03-13 | G   | 18:00  |     | 4   |     | 1    |     |     |     |       |       |         | 1   | 1   | 1   |     | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| House, Danuel         | Texas A&M | Kentucky         | 2016-03-13 | G   | 40:00  | 10  | 23  | 4   | 13   | 8   | 11  | 32  | 3     | 3     | 6       | 1   | 3   |     | 2   |       | 2016 SEC Men's Tournament-Nashville, TN  |
| Jones, Jalen          | Texas A&M | Kentucky         | 2016-03-13 | G   | 37:00  | 6   | 16  | 1   | 4    | 2   | 3   | 15  | 4     | 5     | 9       | 2   | 2   | 1   |     | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Davis, Tyler          | Texas A&M | Kentucky         | 2016-03-13 | C   | 28:00  | 2   | 5   |     |      | 4   | 6   | 8   | 4     | 5     | 9       | 1   | 1   | 1   | 2   | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Gilder, Admon         | Texas A&M | Kentucky         | 2016-03-13 |     | 27:00  | 1   | 1   |     |      |     |     | 2   |       |       |         |     |     | 2   |     | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Hogg, DJ              | Texas A&M | Kentucky         | 2016-03-13 |     | 14:00  | 1   | 1   |     |      |     |     | 2   |       | 1     | 1       |     | 1   |     |     | 3     | 2016 SEC Men's Tournament-Nashville, TN  |
| Miller, Tavario       | Texas A&M | Kentucky         | 2016-03-13 |     | 5:00   |     |     |     |      |     |     |     | 1     |       | 1       |     |     |     |     | 1     | 2016 SEC Men's Tournament-Nashville, TN  |
| Trocha-Morelos, Tonny | Texas A&M | Kentucky         | 2016-03-13 |     | 18:00  | 3   | 7   |     | 2    | 1   | 2   | 7   | 2     | 4     | 6       |     | 1   |     |     | 2     | 2016 SEC Men's Tournament-Nashville, TN  |
| Caruso, Alex          | Texas A&M | Green Bay        | 2016-03-18 | G   | 26:00  | 1   | 3   |     | 1    | 1   | 2   | 3   | 2     | 2     | 4       | 4   | 6   | 4   | 1   | 1     | Chesapeake Arena-Oklahoma City           |
| Collins, Anthony      | Texas A&M | Green Bay        | 2016-03-18 | G   | 25:00  | 1   | 1   |     |      |     |     | 2   |       | 2     | 2       | 3   |     | 3   |     | 3     | Chesapeake Arena-Oklahoma City           |
| House, Danuel         | Texas A&M | Green Bay        | 2016-03-18 | G   | 26:00  | 8   | 12  | 2   | 3    | 2   | 2   | 20  |       | 3     | 3       | 3   | 3   | 1   |     | 1     | Chesapeake Arena-Oklahoma City           |
| Jones, Jalen          | Texas A&M | Green Bay        | 2016-03-18 | F   | 19:00  | 3   | 6   | 1   | 1    | 4   | 6   | 11  | 1     |       | 1       | 1   | 4   | 1   |     | 2     | Chesapeake Arena-Oklahoma City           |
| Davis, Tyler          | Texas A&M | Green Bay        | 2016-03-18 | C   | 21:00  | 4   | 5   |     |      | 4   | 7   | 12  | 1     | 6     | 7       |     | 2   |     |     | 4     | Chesapeake Arena-Oklahoma City           |
| Gilder, Admon         | Texas A&M | Green Bay        | 2016-03-18 |     | 25:00  | 3   | 5   | 1   | 3    | 4   | 4   | 11  |       | 2     | 2       |     | 2   | 1   |     | 2     | Chesapeake Arena-Oklahoma City           |
| Hogg, DJ              | Texas A&M | Green Bay        | 2016-03-18 |     | 22:00  | 3   | 8   | 1   | 5    | 2   | 2   | 9   | 1     | 6     | 7       | 2   | 1   |     |     | 2     | Chesapeake Arena-Oklahoma City           |
| Aparicio, Juan        | Texas A&M | Green Bay        | 2016-03-18 |     | 1:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Chesapeake Arena-Oklahoma City           |
| Eubanks, Kobie        | Texas A&M | Green Bay        | 2016-03-18 |     | 3:00   | 1   | 2   | 1   | 2    |     |     | 3   |       |       |         |     |     |     |     |       | Chesapeake Arena-Oklahoma City           |
| Dobbins, Kyle         | Texas A&M | Green Bay        | 2016-03-18 |     | 1:00   | 1   | 1   |     |      |     |     | 2   | 1     |       | 1       |     | 1   | 1   |     | 1     | Chesapeake Arena-Oklahoma City           |
| Miller, Tavario       | Texas A&M | Green Bay        | 2016-03-18 |     | 10:00  | 1   | 3   |     |      | 2   | 2   | 4   | 2     | 3     | 5       |     | 1   |     |     | 1     | Chesapeake Arena-Oklahoma City           |
| Trocha-Morelos, Tonny | Texas A&M | Green Bay        | 2016-03-18 |     | 21:00  | 6   | 11  | 1   | 4    | 2   | 3   | 15  | 3     | 3     | 6       | 4   |     | 2   |     | 2     | Chesapeake Arena-Oklahoma City           |
| Caruso, Alex          | Texas A&M | UNI              | 2016-03-20 | G   | 43:00  | 10  | 16  | 2   | 5    | 3   | 5   | 25  |       | 9     | 9       | 3   | 5   |     |     | 4     | Chesapeake Arena-Oklahoma City           |
| Collins, Anthony      | Texas A&M | UNI              | 2016-03-20 | G   | 27:00  | 2   | 6   | 2   | 5    |     |     | 6   |       |       |         | 1   | 2   |     |     | 3     | Chesapeake Arena-Oklahoma City           |
| House, Danuel         | Texas A&M | UNI              | 2016-03-20 | G   | 46:00/ | 6   | 17  | 2   | 7    | 8   | 9   | 22  | 2     | 6     | 8       |     | 3   |     |     | 4     | Chesapeake Arena-Oklahoma City           |
| Jones, Jalen          | Texas A&M | UNI              | 2016-03-20 | F   | 38:00  | 5   | 14  | 1   | 6    | 5   | 8   | 16  | 3     | 6     | 9       |     | 3   | 1   |     | 5/    | Chesapeake Arena-Oklahoma City           |
| Davis, Tyler          | Texas A&M | UNI              | 2016-03-20 | C   | 17:00  | 5   | 7   |     |      |     | 2   | 10  | 5     | 2     | 7       | 2   |     |     |     | 2     | Chesapeake Arena-Oklahoma City           |
| Gilder, Admon         | Texas A&M | UNI              | 2016-03-20 |     | 38:00  | 3   | 5   |     | 2    | 5   | 6   | 11  | 1     | 3     | 4       | 2   |     | 2   |     | 2     | Chesapeake Arena-Oklahoma City           |
| Hogg, DJ              | Texas A&M | UNI              | 2016-03-20 |     | 16:00  |     | 3   |     | 3    | 1   | 2   | 1   |       | 2     | 2       |     | 1   | 1   |     | 1     | Chesapeake Arena-Oklahoma City           |
| Miller, Tavario       | Texas A&M | UNI              | 2016-03-20 |     | 6:00   |     |     |     |      |     |     |     |       | 2     | 2       |     |     | 1   |     | 1     | Chesapeake Arena-Oklahoma City           |
| Trocha-Morelos, Tonny | Texas A&M | UNI              | 2016-03-20 |     | 19:00  |     | 3   |     | 3    | 1   | 2   | 1   | 1     | 2     | 3       |     |     | 1   |     | 1     | Chesapeake Arena-Oklahoma City           |
| Caruso, Alex          | Texas A&M | Oklahoma         | 2016-03-24 | G   | 31:00  | 4   | 8   |     | 2    |     |     | 8   | 3     | 1     | 4       | 5   | 1   | 4   |     | 3     | Anaheim, CA                              |
| Collins, Anthony      | Texas A&M | Oklahoma         | 2016-03-24 | G   | 24:00  | 1   | 4   | 1   | 2    |     |     | 3   |       | 2     | 2       | 5   | 3   | 2   |     | 1     | Anaheim, CA                              |
| House, Danuel         | Texas A&M | Oklahoma         | 2016-03-24 | G   | 31:00  | 4   | 13  | 1   | 5    | 1   | 2   | 10  | 1     | 1     | 2       | 1   | 2   |     |     | 2     | Anaheim, CA                              |
| Jones, Jalen          | Texas A&M | Oklahoma         | 2016-03-24 | G   | 25:00  | 3   | 11  | 3   | 7    | 2   | 7   | 11  | 2     | 8     | 10      | 1   | 3   |     |     | 3     | Anaheim, CA                              |
| Davis, Tyler          | Texas A&M | Oklahoma         | 2016-03-24 | C   | 27:00  | 7   | 8   |     |      | 3   | 7   | 17  | 2     | 6     | 8       |     | 1   |     | 3   |       | Anaheim, CA                              |
| Gilder, Admon         | Texas A&M | Oklahoma         | 2016-03-24 |     | 25:00  |     | 5   |     | 4    | 6   | 6   | 6   |       | 3     | 3       |     | 1   |     |     | 1     | Anaheim, CA                              |
| Hogg, DJ              | Texas A&M | Oklahoma         | 2016-03-24 |     | 14:00  | 2   | 8   | 1   | 4    | 1   | 2   | 6   | 4     | 1     | 5       | 1   | 1   |     | 1   |       | Anaheim, CA                              |
| Eubanks, Kobie        | Texas A&M | Oklahoma         | 2016-03-24 |     | 3:00   |     | 1   |     | 1    |     |     |     |       |       |         | 1   |     |     |     |       | Anaheim, CA                              |
| Miller, Tavario       | Texas A&M | Oklahoma         | 2016-03-24 |     | 3:00   |     |     |     |      |     |     |     |       |       |         |     |     |     |     |       | Anaheim, CA                              |
| Trocha-Morelos, Tonny | Texas A&M | Oklahoma         | 2016-03-24 |     | 17:00  | 1   | 6   |     | 3    |     |     | 2   | 1     | 3     | 4       |     |     |     |     | 2     | Anaheim, CA                              |



Lastly let's take a look at the schedule and results for the TAMU Women's VolleyBall team.

``` r
kable(team_schedule(697,2016,"womens volleyball"))
```

| team      | Date       | Opponent                     | site    | OT  | result | Score |  team\_score|  opp\_score|  win|  loss|
|:----------|:-----------|:-----------------------------|:--------|:----|:-------|:------|------------:|-----------:|----:|-----:|
| Texas A&M | 08/28/2015 | @ Stanford                   | Away    | NA  | L      | 0 - 3 |            0|           3|    0|     1|
| Texas A&M | 08/29/2015 | Minnesota @ Stanford, Calif. | Neutral | NA  | W      | 3 - 2 |            3|           2|    1|     1|
| Texas A&M | 09/05/2015 | Abilene Christian            | Home    | NA  | W      | 3 - 1 |            3|           1|    2|     1|
| Texas A&M | 09/05/2015 | Wichita St.                  | Home    | NA  | W      | 3 - 0 |            3|           0|    3|     1|
| Texas A&M | 09/06/2015 | New Mexico St.               | Home    | NA  | W      | 3 - 2 |            3|           2|    4|     1|
| Texas A&M | 09/11/2015 | Milwaukee @ Iowa City, Iowa  | Neutral | NA  | W      | 3 - 1 |            3|           1|    5|     1|
| Texas A&M | 09/11/2015 | Iowa St. @ Iowa City, Iowa   | Neutral | NA  | L      | 1 - 3 |            1|           3|    5|     2|
| Texas A&M | 09/12/2015 | @ Iowa                       | Away    | NA  | L      | 1 - 3 |            1|           3|    5|     3|
| Texas A&M | 09/15/2015 | Colorado St.                 | Home    | NA  | W      | 3 - 2 |            3|           2|    6|     3|
| Texas A&M | 09/18/2015 | @ Florida St.                | Away    | NA  | L      | 1 - 3 |            1|           3|    6|     4|
| Texas A&M | 09/19/2015 | @ Florida A&M                | Away    | NA  | W      | 3 - 0 |            3|           0|    7|     4|
| Texas A&M | 09/27/2015 | Arkansas                     | Home    | NA  | L      | 1 - 3 |            1|           3|    7|     5|
| Texas A&M | 09/30/2015 | @ Auburn                     | Away    | NA  | W      | 3 - 0 |            3|           0|    8|     5|
| Texas A&M | 10/04/2015 | Ole Miss                     | Home    | NA  | W      | 3 - 0 |            3|           0|    9|     5|
| Texas A&M | 10/09/2015 | @ Florida                    | Away    | NA  | L      | 0 - 3 |            0|           3|    9|     6|
| Texas A&M | 10/11/2015 | @ South Carolina             | Away    | NA  | W      | 3 - 2 |            3|           2|   10|     6|
| Texas A&M | 10/16/2015 | Alabama                      | Home    | NA  | W      | 3 - 0 |            3|           0|   11|     6|
| Texas A&M | 10/18/2015 | Mississippi St.              | Home    | NA  | W      | 3 - 0 |            3|           0|   12|     6|
| Texas A&M | 10/21/2015 | LSU                          | Home    | NA  | W      | 3 - 0 |            3|           0|   13|     6|
| Texas A&M | 10/30/2015 | @ Kentucky                   | Away    | NA  | W      | 3 - 1 |            3|           1|   14|     6|
| Texas A&M | 11/01/2015 | @ Tennessee                  | Away    | NA  | W      | 3 - 0 |            3|           0|   15|     6|
| Texas A&M | 11/04/2015 | Missouri                     | Home    | NA  | W      | 3 - 0 |            3|           0|   16|     6|
| Texas A&M | 11/08/2015 | Georgia                      | Home    | NA  | W      | 3 - 0 |            3|           0|   17|     6|
| Texas A&M | 11/13/2015 | @ Ole Miss                   | Away    | NA  | W      | 3 - 2 |            3|           2|   18|     6|
| Texas A&M | 11/15/2015 | @ Mississippi St.            | Away    | NA  | W      | 3 - 0 |            3|           0|   19|     6|
| Texas A&M | 11/18/2015 | Kentucky                     | Home    | NA  | W      | 3 - 0 |            3|           0|   20|     6|
| Texas A&M | 11/22/2015 | Florida                      | Home    | NA  | W      | 3 - 2 |            3|           2|   21|     6|
| Texas A&M | 11/25/2015 | @ Missouri                   | Away    | NA  | W      | 3 - 2 |            3|           2|   22|     6|
| Texas A&M | 11/28/2015 | @ Arkansas                   | Away    | NA  | W      | 3 - 1 |            3|           1|   23|     6|
| Texas A&M | 12/04/2015 | A&M-Corpus Chris             | Home    | NA  | W      | 3 - 0 |            3|           0|   24|     6|
| Texas A&M | 12/05/2015 | Hawaii                       | Home    | NA  | L      | 0 - 3 |            0|           3|   24|     7|

Functionality
-------------

This package should be functional for all sports except for Football. The next update should have full functionality for Football as well.

There are three main functions that provide data of interest:
(1) team\_stats = Overall team stats (either per season or per game)
(2) player\_stats = All player stats (either per season or per game)
(3) team\_schedule = Team Schedule/Result/Site/Record

Future Work
-----------

I'm looking to add functionality. What you should expect shortly:
(1) College Football Functionality.
(2) Attendance (per game/season avg)
(3) Play by Play data (as available)
(4) Weekly Rankings (AP and CFP)
(5) Recruiting Details (From 247 sports)

If you'd like to suggest anything (can be sport specific or general), create a github issue. Or tweet at me \[@msubbaiah1\](<https://twitter.com/msubbaiah1>).
