<%!

/**
 *@author:MPS
 *@param:tratamento de strings
 **/

public boolean isStringVazia(String dados){
    if((dados!=null) && (!dados.isEmpty())){
        return true;
    }else{
        return false;
    }
}

public boolean isTamanhoString(String dados,int intDados){
    dados=dados.trim();
    if(dados.length()==intDados){
        return true;
    }else{
        return false;
    }
}

public boolean isEmail(String dados){
    String[] strDados,strDados2;
    strDados = new String[5];
    if(isStringVazia(dados)){
        if(dados.indexOf("@")!=-1){
           strDados=dados.split("@");
           if((strDados[0].length()>1) && (strDados[1].indexOf(".")!=-1)){
               int qtdPontos=0;
               for(int x=0;x<strDados[1].length();x++){
                   if(strDados[1].substring(x,x+1).equals(".")){
                    qtdPontos++;
                 }
               }
               if((qtdPontos==1) && (strDados[1].length()>=5)){
                    return true;
               }else if((qtdPontos>1) && (strDados[1].length()>=8)){
                    return true;
               }else{
                return false;
               }
           }else{
                return false;
           }
        }else{
           return false;
        }
    }else{
        return false;
    }

}

public String saida(String dados){
     return dados;
}

public boolean isCep(String dados){
    String[] strDados;
    String   strDados2;
    Double   dblDados;
    dblDados=0.0;
    strDados = new String[5];
    if(isStringVazia(dados)){
        if((isTamanhoString(dados,9)) && (strDados[1].indexOf("-")!=-1)){
           strDados=dados.split("-");
           strDados2=strDados[0]+strDados[1];
           dblDados=dblDados.parseDouble(strDados2);
           if(isNumero(dblDados)){
                return true;
              }else{
                return false;
              }
           }else{
             return false;
           }
        }else{
            return false;
        }
}


public String[] getStringCampoHtml(HttpServletRequest request){
    /*
    fazer function para receber dados de formulario e retornar variavel neste
    padrao:
    campoHtml['txtNome']=request.getParameter("txtNome");
    campoHtml['chkNome']=request.getParameter("chkNome");
    o nome do campo será a chave da variavel campoHtml e esta
    funcao retornara uma string de arrays
    esta funcao a principio sera estatica recebendo os dados estaticamente e
    atribuindo a variavel, mas a ideia incial eh que:
    ->dinamicamente esta funcao leia e descubra quantos campos html estao vindo
    ->ao saber a quantidade de campos, dinamicamente ira atribuir estes campos
    para os seus devidos valores de chave de array;
    ->retornar o array de strings com os dados recolhidos dinamicamentes.
    */
    String campo;
    String[] campoHtml;
    Integer intCampo;
    campoHtml = new String[20];
    campo=request.getParameter("txtNome");
    intCampo=Integer.parseInt(campo);
    //campoHtml["txtNome"].copyValueOf(campo);
    //em andamento...

    return campoHtml;
}



/**
 *@author:MPS
 *@param:tratamento de valores numericos
 **/
public boolean isNumero(Double dados){
    if(!dados.isNaN()){
        return true;
    }else{
        return false;
    }
}

public double toValorHtmlPGsql(String dados){
    Double dblDados;
    String strDados;
    dblDados=0.0;
    dados=dados.replace(".","");
    dados=dados.replace(",",".");
    return Double.parseDouble(dados);
}

public String toValorPGsqlHtml(Double dados){
    Double dblDados;
    String strDados;
    dblDados=0.0;
    strDados=Double.toString(dados);
    strDados=strDados.replace(".",",");
    //strDados=strDados.replace(",",".");
    return strDados;
}

public boolean isCPF(Double dados){
    if(isNumero(dados)){
        return true;
    }else{
        return false;
    }
}

public boolean isCNPJ(Double dados){
    if(isNumero(dados)){
        return true;
    }else{
        return false;
    }
}

public boolean isTelResidencia(Double dados){
    if(isNumero(dados)){
        return true;
    }else{
        return false;
    }
}

public boolean isTelCelular(Double dados){
    if(isNumero(dados)){
        return true;
    }else{
        return false;
    }
}


/**
 *@author:MPS
 *@param:tratamento de data
 **/
public boolean isData(String dados){
    String[] strDados;
    Double   dblDados0=0.0,dblDados1=0.0,dblDados2=0.0;
    if(isStringVazia(dados)){
        if(dados.indexOf("/")!=-1){
           strDados=dados.split("/");
           dblDados0=Double.parseDouble(strDados[0]);
           dblDados1=Double.parseDouble(strDados[1]);
           dblDados2=Double.parseDouble(strDados[2]);
           if((isNumero(dblDados0)) && (isNumero(dblDados1)) && (isNumero(dblDados2))){
                if((dblDados0>=1) && (dblDados0<=31) && (dblDados1>=1) && (dblDados1<=12) && (dblDados2>1900) && (dblDados2<2200)){
                    return true;
                }else{
                    return false;
                }
           }else{
            return false;
           }
        }else{
            return false;
        }
    }else{
        return false;
    }
}

public String toDataHtmlPGsql(String dados){
    String[] strDados;
    strDados=dados.split("/");
    return strDados[2]+"-"+strDados[1]+"-"+strDados[0];
}

public String toDataPGsqlHtml(String dados){
    String[] strDados,strDados2;
    String   strHtml;
    strDados = dados.split(" ");
    strDados2 = strDados[0].split("-");
    strHtml = strDados2[2]+"/"+strDados2[1]+"/"+strDados2[0];
    return strHtml.substring(0,10);
}

%>