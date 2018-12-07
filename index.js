var express=require('express');
let app=express();

var jq = require("jquery");


app.use('/template',express.static('./template/'));
app.use('/jquery', express.static('./template/js/node_modules/jquery/dist/'));

app.set('views','./template');//여기 디렉토리에 템플릿 파일을 넣겠다는 선언
app.set('view engine','ejs');//어떤 형식의 템플릿을 사용할 것인지 선언
app.locals.pretty=true;


let bodyParser=require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

let OrientDB=require('orientjs');
let server=OrientDB({
  host:'localhost',
  port:2424,//기본 포트
  username:'root',
  password:'****'
});
let db=server.use('gettingStarted');
console.log('Using Database:'+ db.name);

app.get('/',function(req,res){
  res.render('index.ejs');
});

app.get('/signup',function(req,res){
  //let title='학생 성적표 등록하기';
  res.render('signup.ejs');
});
app.post('/signup',function(req,res){
  let pname=req.body.personName;
  let pdate=req.body.personBirthDate;
  let pbloodtype=req.body.personBloodType;
  let pemail=req.body.personEmail;
  let ppocket=req.body.personPocket;
  let pid=req.body.personID;
  let ppwd=req.body.personPwd;
  let ppwd2=req.body.personPwd2;

let sql='insert into personInfo (name,birthDate,bloodType,email,coinPocket,id,pwd)'+
  'values(:name,:birthDate,:bloodType,:email,:coinPocket,:id,:pwd)';
    db.query(sql,{
      params:{
        name:pname,
        birthDate:pdate,
        bloodType:pbloodtype,
        email:pemail,
        coinPocket:ppocket,
        id:pid,
        pwd:ppwd
      }
    }).then(function(results){
      })
  res.redirect('/');
})



app.listen(3000,function(req,res){
  console.log('port 3000 connected!');
});
