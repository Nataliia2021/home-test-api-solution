function fn() {
  var env = karate.env; 
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'http://localhost:3100/api'  // add your API base URL here
  }
  if (env == 'dev') {
  } else if (env == 'e2e') {
  }
  return config;
}