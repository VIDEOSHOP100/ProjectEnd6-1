var url=window.location.host;
var wsProtocol = 'https:' == document.location.protocol ? 'https' : 'http';
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var loginUrl=wsProtocol+"://"+url+projectName+"/loginPage";


