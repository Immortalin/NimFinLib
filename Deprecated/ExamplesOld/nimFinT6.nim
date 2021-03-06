import os,nimcx,nimFinLib,libFinHk,nimdataframe

# Example nimFinT6   
# requires nimdataframe
# 
# FOR HONGKONG HKEX STOCK CODES
# 
# 
# Run :  ./nimFinT6 0001.HK 0002.HK 0005.HK 2388.HK
#
# 
# 
# How to use Stocks and Stockdata types and various functions
# 

var astockcode = "" 
 
proc quickStock(mystockcode:string) = 
  
      if mystockcode.endswith(".HK"):
        
            # Stocks type
            var myD = initStocks()
            myD = getSymbol2(mystockcode,minusdays(getDateStr(),365),getDateStr())  
            var boardlot = getBoardlot(myD)
            var comp = getCompanyName(myD)

            # Stockdata type
            var myD2 = getSymbol3(mystockcode)  


            echo clearline
            printLnBiCol("Code     : " & myD.stock)  
            printLnBiCol("Company  : " & comp)
            printLnBiCol("Boardlot : " & boardlot)
            printLnBiCol("Date     : " & myD.date[0])  # most recent date on yahoo

            printLnBiCol("Cur.Price: " & ff2(myD2.price,4) & "  Moving Avg. 50 days: " & ff2(myD2.movingavg50day,4))
            var costperboardlot = myD2.price * parseFloat(boardlot)
            printLnBiCol("Cost     : " & ff2(costperboardlot,2) & " per boardlot")

      else:
        
            printLn(mystockcode & spaces(1) & rightarrow & " wrong stock code or not Hongkong HKEX yahoo style code",red)

if paramCount() == 0: 
   
   astockcode = "0386.HK"   # yahoo stock code
   printLnBiCol("Code     : " & spaces(1) & astockcode & spaces(1),styled = {styleReverse})
   quickStock(astockcode)  
else:
   for x in 1.. paramCount():
      printLnBiCol("Code     : " & spaces(1) & strutils.toupper(paramStr(x)) & spaces(1),styled = {styleReverse})
      astockcode = strutils.toupper(paramStr(x))
      quickStock(astockcode)
      decho(2)
  
  

# show latest stock quotes
showCurrentStocks("IBM+BP.L+0001.HK")

showCurrentIndexes("^HSI+^FTSE")
decho(2) 
  
doFinishHk()       

