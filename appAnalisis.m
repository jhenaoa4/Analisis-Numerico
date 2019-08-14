%%App 6
format long
running=true;
%%while(running==true)
    %%Crear Máquina
    fprintf('CREA TU PROPIA pitufiMÁQUINA \n Esta máquina tiene 17 bits en total \n Distiribuidos de la siguiente forma: SignoMantisa|SignoExponente|BitsExponente|BitsMantisa');
    bits = 17;
    mantisa = input('Primero determine la cantidad de bits correspondientes para la mantisa y el exponente (tenga en cuenta que 2 bits están reservados para los signos y que la máquina trabaja con un bit implícito)\n Primero ingrese los bits de la mantisa \n');
    while mantisa >14
        mantisa = input('Ingrese un numero válido para la mantisa');
    end
    exponente = input('Ahora ingrese los bits para el exponente \n');
    while mantisa+exponente > 14
        exponente = input('Ingrese un numero válido para el exponente \n');
    end
    
    maquina= pitufiMaquina;
    maquina.crearMaquina(mantisa+1,exponente);
    
    %% Calcular maximo numero positivo
     maquina.maxNumber();
    
    %% el numero entero mas pequeño
    maquina.minNumber();
    %%Epsilon de la maquina
    maquina.epsilonMaquina();
    maquina.epsilon;
    fprintf('Tu pitufiMáquina ha sido creada con éxito \nTiene %i bits para la matisa y %i bits para el exponente \n', mantisa, maquina.exponente);
    fprintf('El máximo número positivo que puede almacenar esta máquina es: %i (de este número en adelante se tomará como infinito)', maquina.max);
    fprintf('\nEl número positivo más pequeño que puede almacenar esta máquina es: %i', maquina.min);
    fprintf('\nEl épsilon de la máquina es: %i', maquina.epsilon);
    
    %% Operaciones a realizar con la máquina creada
    empezar=1;
    while(empezar~=0)
    opcion = input('\n¿Qué quieres hacer con tu pitufiMáquina? (Introduzca el número correspondiente a la función que desea realizar) \n 1. Hallar el número máquina (cadena de bits) correspondiente a un número base 10 \n 2. Hallar número base 10 correspondiente a un número máquina \n 3. Sumar, restar, multiplicar o dividir dos números \n Oprima otro número para salir de la aplicación y función sorpresa');
    if opcion == 1
        num = input('Ingrese el número que desea convertir');
        a = maquina.numToMaqu(num);
        fprintf('El número máquina (cadena de bits) correspondiente a tu número en base 10 es: %s',a);
        empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
    elseif opcion == 2
           num = input('Ingrese el número que desea convertir entre comillas');
           while (contains(num,"2")==1||contains(num,"3")==1||contains(num,"4")==1||contains(num,"5")==1||contains(num,"6")==1||contains(num,"7")==1||contains(num,"8")==1||contains(num,"9")==1)
           num = input('Ingrese un número binario válido entre comillas');
           end
           a=maquina.maquToDec(num);
           fprintf('El número decimal del número máquina que ingresaste es: %i',a);
           empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
    elseif opcion == 3
        opera = input('\n¿Quieres sumar, restar, multiplicar o dividir? \n 1. Sumar números decimales \n 2. Sumar números máquina \n 3. Restar números decimales \n 4. Restar números máquina \n 5. Multiplicar números decimales \n 6. Mutipicar números máquina \n 7. Dividir números decimales \n 8. Dividir números maquina');
        if opera == 1
            num1 = input('Ingrese el primer número');
            num2 = input('Ingrese el segundo número');
            a =maquina.sumDec(num1,num2);
            fprintf('La suma de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==2
            num1 = input('Ingrese el primer número entre comillas');
            while (contains(num1,"2")==1||contains(num1,"3")==1||contains(num1,"4")==1||contains(num1,"5")==1||contains(num1,"6")==1||contains(num1,"7")==1||contains(num1,"8")==1||contains(num1,"9")==1)
                num1 = input('Ingrese un número binario válido entre comillas');
            end
            num2 = input('Ingrese el segundo número entre comillas');
            while (contains(num2,"2")==1||contains(num2,"3")==1||contains(num2,"4")==1||contains(num2,"5")==1||contains(num2,"6")==1||contains(num2,"7")==1||contains(num2,"8")==1||contains(num2,"9")==1)
                num2 = input('Ingrese un número binario válido entre comillas');
            end
            a = maquina.sumMaqu(num1,num2);
            fprintf('La suma de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==3
            num1 = input('Ingrese el primer número');
            num2 = input('Ingrese el segundo número');
            a = maquina.restaDec(num1,num2);
        fprintf('La resta de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==4
            num1 = input('Ingrese el primer número entre comillas');
            while (contains(num1,"2")==1||contains(num1,"3")==1||contains(num1,"4")==1||contains(num1,"5")==1||contains(num1,"6")==1||contains(num1,"7")==1||contains(num1,"8")==1||contains(num1,"9")==1)
                num1 = input('Ingrese un número binario válido entre comillas');
            end
            num2 = input('Ingrese el segundo número entre comillas');
            while (contains(num2,"2")==1||contains(num2,"3")==1||contains(num2,"4")==1||contains(num2,"5")==1||contains(num2,"6")==1||contains(num2,"7")==1||contains(num2,"8")==1||contains(num2,"9")==1)
                num2 = input('Ingrese un número binario válido entre comillas');
            end
            a = maquina.restaMaqu(num1,num2);
        fprintf('La resta de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==5
            num1 = input('Ingrese el primer número');
            num2 = input('Ingrese el segundo número');
            a = maquina.multiplicacionDec(num1,num2);
        fprintf('La multiplicación de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==6
            num1 = input('Ingrese el primer número entre comillas');
            while (contains(num1,"2")==1||contains(num1,"3")==1||contains(num1,"4")==1||contains(num1,"5")==1||contains(num1,"6")==1||contains(num1,"7")==1||contains(num1,"8")==1||contains(num1,"9")==1)
                num1 = input('Ingrese un número binario válido entre comillas');
            end
            num2 = input('Ingrese el segundo número entre comillas');
            while (contains(num2,"2")==1||contains(num2,"3")==1||contains(num2,"4")==1||contains(num2,"5")==1||contains(num2,"6")==1||contains(num2,"7")==1||contains(num2,"8")==1||contains(num2,"9")==1)
                num2 = input('Ingrese un número binario válido entre comillas');
            end
            a= maquina.multiplicacionMaqu(num1,num2);
            fprintf('La multiplicación de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        elseif opera ==7
            num1 = input('Ingrese el primer número');
            num2 = input('Ingrese el segundo número');
            a= maquina.divisionDec(num1,num2);
            fprintf('La división de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        else
            num1 = input('Ingrese el primer número entre comillas');
            while (contains(num1,"2")==1||contains(num1,"3")==1||contains(num1,"4")==1||contains(num1,"5")==1||contains(num1,"6")==1||contains(num1,"7")==1||contains(num1,"8")==1||contains(num1,"9")==1)
                num1 = input('Ingrese un número binario válido entre comillas');
            end
            num2 = input('Ingrese el segundo número entre comillas');
            while (contains(num2,"2")==1||contains(num2,"3")==1||contains(num2,"4")==1||contains(num2,"5")==1||contains(num2,"6")==1||contains(num2,"7")==1||contains(num2,"8")==1||contains(num2,"9")==1)
                num2 = input('Ingrese un número binario válido entre comillas');
            end
            a= maquina.divisionMaqu(num1,num2);
            fprintf('La división de los números es: %i',a);
            empezar=input('\n¿Quieres hacer otra operación? \n Oprime 1 para Sí y 0 para No \n Ten en cuenta que al oprimir 0 sales de la aplicación');
        end
    else
       chiste = 1;
       while (chiste ~= 0)
       chiste = input('¿Sabes que es una nariz? \n 1 para si, 0 para no');
       end
       fprintf('Algo muy sonado');
       empezar=0;
    end
    end
    
% end