%%PitufiMaquina
classdef pitufiMaquina < handle
    properties
        mantisa=0;
        exponente=0;
        max;
        min;
        epsilon;
    end
    methods (Static)
        function [out]= binDec2Dec(num)%% Recibe string pasa de binario a decimal (solo la parte decimal)
            menos=false;
            if startsWith(num,'-')
                menos=true;
                num=erase(num,'-');
            end
            num=erase(num,".");
            l=strlength(num)-1;
            twos=2^l;
            sum=0;
            num = str2double(num);
            while num ~= 0
                sum=sum+mod(num,10)/twos;
                num=floor(num/10);
                twos=twos/2;
            end
            if menos
            out=-sum;
            else
                out=sum;
            end
        end
        function [out]=binEnteroToDec(num)%%pasa de binario a decimal (solo la parte entera)
            sum=0;
            menos=false;
            if num<0
                menos=true;
            end
            num=abs(num);
            pot2=1;
            while(num~=0)
                sum=sum+ (mod(num,10)*pot2);
                num=floor(num/10);
                pot2=pot2*2;
            end
            if menos
            out=-sum;
            else
                out=sum;
            end
        end
        function [out]= numEnteroToBin(num)
             s='';
            temp=abs(num);
            while(temp~=1 )
                n=mod(temp,2);
                if(n==0)
                    s=strcat(s,'0');
                else
                    s=strcat(s,'1');
                end
                temp=floor(temp/2);
            end
            s=strcat(s,'1');
       
            if num<0
                s=strcat(s,'-');
            end
            s=fliplr(s);
            out= str2double(s); %%double
        end %%pasa de entero a binario (solo parte entera)
        function [out]=numDecToBin(num)
            bin='';
            while num~=0
                num=num*2;
                ent=floor(num);
                aux=num2str(ent);
                bin=strcat(bin,aux);
                num=mod(num,1);
                
            end
            n=strcat('0.',bin);
            out=str2double(n); %%string
        end %%pasa de entero a binario (solo parte decimal)

    end
    methods
        function crearMaquina(obj,m,e) %%constructor
            obj.mantisa=m;
            obj.exponente=e;
        end
        function maxNumber(obj) %%calcula max numero
           s='';
            for i=1: obj.mantisa+2+obj.exponente
             s=strcat(s,'1');
            end
%             numm=str2double(s);
%             s='';
%             for i=1:obj.exponente
%                 s= strcat(s,'1');
%             end
%             dece=bin2dec(s);
%             numm= numm*10^(-obj.mantisa);
%             nyex=numm*10^(dece);
%             obj.max=obj.binToDec(nyex);
             obj.max= obj.maquToDec("11111111111111111");
        end
        function minNumber (obj) %%calcula el mínimo número positivo de la máquina       
            s='';
            for i=1:obj.exponente
                s= strcat(s,'1');
            end
            dece=bin2dec(s);

            num="0.1";
            for i=1: dece
                num=strcat('0',num);
            end
            obj.min=obj.binDec2Dec(num);
        end  
        function epsilonMaquina(obj)%%Calcula el epsilon de la máquina

            obj.epsilon= 2^(-(obj.mantisa-1));
            
        end 
        function [out]= maquToDec(obj,nmaqu)%%Convierte de número máquina a decimal
            %%el que invalida la longitud es la aplicacion
            signoM=extractBefore(nmaqu,2);
            signoE=extractBetween(nmaqu,2,2);
            exp=extractBetween(nmaqu,3,2+obj.exponente);
            mant=extractBetween(nmaqu,2+obj.exponente+1,strlength(nmaqu));
            %%agregar bit implicito
            mant=strcat('1',mant);
            mant=str2double(mant);
            mant=mant*10^(-obj.mantisa);
            exp=str2double(exp);
            exp=obj.binEnteroToDec(exp);
            %%interpretar signo del exponente
            if signoE=='0'
                myex=mant*10^(-exp);
            else
                myex=mant*10^(exp);
            end
            %%convertir numero a decimal
            num=obj.binToDec(myex);
            %%interpretar signo mantisa=
            if signoM=='0'
                out=-num;
            else
                out=num;
            end
            
        end
        function [out]= numToMaqu(obj,num) %%Convierte de decimal a número máquina
            if num>obj.max
                out='inf';
            else
                maquina='';
                %%ver signo de la mantisa
                num=obj.decToBin(num);
                if num>0
                    signoM='1';
                else
                    signoM='0';
                end
                maquina=strcat(maquina,signoM);
                if abs(num)>=1
                    signoE='1';
                    exp=abs(num);
                    exp=floor(exp);
                    exp=num2str(exp);
                    e=strlength(exp);
                    exp=obj.decToBin(e);
                    exp=num2str(exp); 
                else
                    signoE='0';
                    n=num2str(num);
                    n=extractAfter(n,'2');
                    vec = split(n,"1");
                    exp=strlength(vec(1));
                    exp= obj.decToBin(exp);
                    exp=num2str(exp);
                end
                maquina=strcat(maquina,signoE);
                while (strlength(exp)< obj.exponente)
                    exp=strcat('0',exp);
                end
                maquina=strcat(maquina,exp);
                if abs(num)<1 %%sirven para eliminar la letra e cuando se pasa el nro a string
                    while contains(num2str(num),"e")
                        num=num*10;
                    end
                else
                    while contains(num2str(num),"e")
                        num=num/10;
                    end
                end
                num = num2str(num);
                num=erase(num,".");
                num=str2double(num);
                l=strlength(num2str(num));
                while (l < obj.mantisa)
                   num=num*10;
                   l=l+1;
                end
                m=2;
                newnum = "";
                while (m < obj.mantisa+1)
                   newnum=strcat(newnum,extractBetween(num2str(num),m,m));
                    m=m+1;
                end
                maquina=strcat(maquina,newnum);
          out=maquina;
            end
        end
        function [out]= binToDec(obj,num) %%pasa de binario a Decimal
            menos=false;
            if num<0
                menos=true;
                num=abs(num);
            end
            if mod(num,1)~=0
                ent=floor(num);
                dec=mod(num,1);
                if ent~=0
                ent=obj.binEnteroToDec(ent);
                end
                if dec~=0
                n=num2str(dec);
                dec=obj.binDec2Dec(n);
                end
                if menos
                    out=-(ent+dec);
                else
                out=ent+dec;
                end
            else
                 if menos
                    out=-(obj.binEnteroToDec(num));
                 else
                out=obj.binEnteroToDec(num);
                 end
            end
            
        end
        function [out]= decToBin(obj,num)%%pasa de decimal a binario
            menos=false;
            if num==0
                out=0;
            else
            if num<0
                menos=true;
                num=abs(num);
            end
            if mod(num,1)~=0
                ent=floor(num);
                dec=mod(num,1);
                if ent~=0
                ent=obj.numEnteroToBin(ent);
                end
                dec=obj.numDecToBin(dec);
                if menos
                    out=-(ent+dec);
                else
                out=ent+dec;
                end
            else
                if menos
                   out=-obj.numEnteroToBin(num);
                else
                out=obj.numEnteroToBin(num);
                end
            end
            end
        end
        function [out]= sumMaqu(obj,num1,num2) %%suma dos numeros máquina insertados por el usuario
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a+b;
            out=total;
        end
        function [out]= restaMaqu(obj,num1,num2)
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a-b;
            out=total;
        end %%resta dos numeros máquina insertados por el usuario
        function [out]= multiplicacionMaqu(obj,num1,num2)
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a*b;
            out=total;
        end %% multiplica dos numeros máquina insertados por el usuario
        function [out]= divisionMaqu(obj,num1,num2)
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a/b;
            out=total;
        end %% divide dos numeros máquina insertados por el usuario
        function [out]= sumDec(obj,num1,num2)
            num1=obj.numToMaqu(num1);
            num2=obj.numToMaqu(num2);
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=numToMaqu(a+b);
            total=maquToDec(total);
            out=total;
        end %%suma dos numeros decimales insertados por el usuario, interprestados por la máquina
        function [out]= restaDec(obj,num1,num2)
            num1=obj.numToMaqu(num1);
            num2=obj.numToMaqu(num2);
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a-b;
            out=total;
        end %% resta dos numeros decimales insertados por el usuario, interprestados por la máquina
        function [out]= multiplicacionDec(obj,num1,num2)
            num1=obj.numToMaqu(num1);
            num2=obj.numToMaqu(num2);
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a*b;
            out=total;
        end %% multiplica dos numeros decimales insertados por el usuario, interprestados por la máquina
        function [out]=divisionDec(obj,num1,num2)
            num1=obj.numToMaqu(num1);
            num2=obj.numToMaqu(num2);
            a=obj.maquToDec(num1);
            b=obj.maquToDec(num2);
            total=a/b;
            out=total;
        end %% divide dos numeros decimales insertados por el usuario, interprestados por la máquina
    end
end
  