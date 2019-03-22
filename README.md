# ipBatTool
The project aims to create an windows bash based IP utility that pings the input domain name address and store the corresponding IP in local file if the connection is established.

##  Technology/Setup
-   Windows devices (Windows 7/10)

##  General info
This project is inspired by the inconsistent network connection at home. I take this opportunity to learn bash scripts and develop a simple ip utility to test the internet connection by pinging the input domain name. 

##  Features
1.  Converting domain name to IP
    -   Ping the input domain name repeatedly until the terminate signal "crtl+c" is inputted 
    -   Trace the target domain name and stores the corresponding IP into ~\traced.txt
    -   Input a new domain name for pinging after terminating the previous process 
    -   Display the target ip
    -   Quit the program by inputting "q" 

##  Creator
developed by [@Spear_Ace]
