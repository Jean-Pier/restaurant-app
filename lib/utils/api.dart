class ApiRoutes {
  static const baseUrl = "https://jd6n2tmzf3.execute-api.us-east-1.amazonaws.com/jeanmauricio/";
  static get apiKey => "sPm1nFfR4P7rCNbzYyFle3yPdc5gHnpP88rBf83Y";
  static get photoTypes => "$baseUrl/photo-types"; //GET
  static get restaurants => "$baseUrl/restaurants"; //POST
  static get signedUrl => "$baseUrl/signed-url"; //signed-url?fileName=1903456789123_1.jpg  //GET
  static get healthCheck => "$baseUrl/health-check"; //GET
}