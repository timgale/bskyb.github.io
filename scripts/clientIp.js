function getClientIP(originalLocation) {
  console.log('gci');
  $.ajax({
    type: "GET",
    url: "https://api.ipify.org?format=json",
    contentType: 'application/json',
    async: true,
    success: function(response){
      var clientIP = response.ip;
      if(originalLocation == 'index') {
        if(clientIP.indexOf("90.216.134.") > -1 || clientIP.indexOf("90.216.150.") > -1) {
          window.location = "/internalHtml"
        }
      } else if (originalLocation == 'internal') {
        if(!(clientIP.indexOf("90.216.134.") > -1 || clientIP.indexOf("90.216.150.") > -1)) {
          window.location = "/"
        }
      }
    }
  });
}
