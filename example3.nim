import nimFinLib,times

# example to quickly display var. data items for one stock code and forex


decho(2)
var z = initDf()
var symb = "EWG"
z = getsymbol2(symb,"2010-01-01",getDateStr())

var days = 100
hdx() do : echo "EMA-" & $days & " for " & symb 
showEma(ema(z,days),5)

hdx() do : echo "Historical Data for " & symb
showHistData(z,5)

hdx() do : echo "Statistcs"
showStatistics(z)

hdx() do : echo "DailyReturns for " & symb
showDailyReturnsCl(z,5)

showCurrentStocks(symb)
decho(1)

hdx() do : echo "Latest Forex"
showCurrentForex(@["EURUSD","GBPEUR","EURCNY","AUDHKD"])

decho(2)  













 
# next step is to table this data like in pandas



 
     
quit 0   