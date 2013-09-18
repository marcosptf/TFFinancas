/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload=function(){
  var a,b,c,d,e,f,g,h,i,j;
  function $(id){return document.getElementById(id);}
  function strTrim(str){
      if(str.indexOf(" ")!=-1){
          a="";
          for(x=0;x<str.length;x++){
          b=str.substring(x,x+1);
            if((b!=" ")){a+=b;}
          }
          str=a.replace("undefined","");
      }
      return str;
  }

  $("sbmGravar").onclick=function(){
      a=strTrim($("txtNomeConta").value);
      b=strTrim($("txtValorConta").value);
      c=strTrim($("txtVencimentoConta").value);d="";
      if(a.length>=4){
          if(b.length>=4){
              if(c.length>=4){
                  if($("cmbSacado").value!=""){
                      if($("cmbStatus").value!=""){
                          if($("cmbContaMes").value!=""){
                              if($("cmbContaAno").value!=""){
                                document.frmInsereContas.submit();
                              }else{
                                d="favor escolher o ano da conta";
                                $("cmbContaAno").focus();
                              }
                          }else{
                            d="favor escolher o mês da conta";
                            $("cmbContaMes").focus();
                          }
                      }else{
                        d="favor escolher o status da conta";
                        $("cmbStatus").focus();
                      }
                  }else{
                   d="favor escolher o sacado da conta";
                   $("cmbSacado").focus();
                  }
              }else{
                d="favor digitar o vencimento da conta";
                $("txtVencimentoConta").focus();
              }
          }else{
            d="favor digitar o valor da conta";
            $("txtValorConta").focus();
          }
      }else{
        d="favor digitar o nome da conta";
        $("txtNomeConta").focus();
      }
      if(d!=""){alert(d);}
  }
  $("txtVencimentoConta").onkeyup=function(){
      a=strTrim($("txtVencimentoConta").value);
      if((a.length==2) || (a.length==5)){
          $("txtVencimentoConta").value+="/";
      }else if(a.length>10){
          b=$("txtVencimentoConta").value;
          $("txtVencimentoConta").value=b.substring(0,10);
      }
  }
}
