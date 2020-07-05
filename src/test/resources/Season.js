function(currentSeason,allSeasons)
{
    var seasonsLength= allSeasons.length

    for (var i=0; i<seasonsLength; i++)
      {
       if (allSeasons[i]==currentSeason)
          { return '#present' }
       }
     return '#notpresent'
}