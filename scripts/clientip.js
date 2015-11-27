function getClientIP(fromInternal) {
   var clientIP = getIpAddress();
   //ga('create', 'UA-67638506-1', 'auto');
   ga('create', 'UA-67638506-2', {'cookieDomain': 'none'});

   if(clientIP.indexOf("90.216.134.") > -1 || clientIP.indexOf("90.216.150.") > -1) {
     ga('set', 'dimension1', "internal");
   } else {
     ga('set', 'dimension1', "external");
   }

   ga('send', 'pageview', 'ipAddress');

   if(fromInternal) {
     if(!(clientIP.indexOf("90.216.134.") > -1 || clientIP.indexOf("90.216.150.") > -1)) {
       window.location = "/"
     }
   } else {
     if(clientIP.indexOf("90.216.134.") > -1 || clientIP.indexOf("90.216.150.") > -1) {
       window.location = "/internalHtml"
     }
   }
}
