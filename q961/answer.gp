t=0;for(i=1,1000000,t+=eulerphi(i));print(t)       \\ => 303963552392
t=0;for(i=1000001,2000000,t+=eulerphi(i));print(t) \\ => 911891146886
t=0;for(i=2000001,3000000,t+=eulerphi(i));print(t) \\ => 1519817723688
t=0;for(i=3000001,4000000,t+=eulerphi(i));print(t) \\ => 2127744824794
t=0;for(i=4000001,5000000,t+=eulerphi(i));print(t) \\ => 2735673275360
t=0;for(i=5000001,6000000,t+=eulerphi(i));print(t) \\ => 3343598468912
t=0;for(i=6000001,7000000,t+=eulerphi(i));print(t) \\ => 3951525608928
t=0;for(i=7000001,7777776,t+=eulerphi(i));print(t) \\ => 3493697029706
