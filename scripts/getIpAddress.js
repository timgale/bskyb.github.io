var clientIp = ''

function getIpAddress() {
  if(clientIp == '') {
    $.ajax({
      type: "GET",
      url: "https://api.ipify.org?format=json",
      contentType: 'application/json',
      async: false,
      success: function(response){
        clientIp = response.ip;
      },
    });
  }

  return clientIp;
}
