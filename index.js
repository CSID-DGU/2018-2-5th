var express=require('express');
let app=express();

var jq = require("jquery");


app.use('/template',express.static('./template/'));
app.use('/jquery', express.static('./template/js/node_modules/jquery/dist/'));

app.set('views','./template');//여기 디렉토리에 템플릿 파일을 넣겠다는 선언
app.set('view engine','ejs');//어떤 형식의 템플릿을 사용할 것인지 선언
app.locals.pretty=true;

let OrientDB=require('orientjs');
let server=OrientDB({
  host:'localhost',
  port:2424,//기본 포트
  username:'root',
  password:'5whrkwmdk'
});
let db=server.use('bloodCoins');
console.log('Using Database:'+ db.name);

app.get('/',function(req,res){
  res.render('index.ejs');
});


app.listen(3000,function(req,res){
  console.log('port 3000 connected!');
});
