//function g = gcd(a,b)
//    if a == 0 then
//        g = b
//    else
//        g = gcd(modulo(b,a),a)
//    end
//endfunction
//
//a = 10;
//b = 15;
//disp("gcd(" + string(a) + ", " + string(b) + ") = " + string(gcd(a, b)));

//
//function [g, x, y] = gcdExtended(a, b)
//    if a == 0 then
//        g = b;
//        x = 0;
//        y = 1;
//        return;
//    end
//    
//    [g, x1, y1] = gcdExtended(modulo(b, a), a);
//    
//    x = y1 - floor(b/a) * x1;
//    y = x1;
//endfunction
//
//a = 15;
//b = 35;
//[g, x, y] = gcdExtended(a, b);
//disp("gcd(" + string(a) + ", " + string(b) + ") = " + string(g));
//disp("Coefficients: x = " + string(x) + ", y = " + string(y));


//function  exmod = modExp(a, b, n)
//    exmod = 1;
//    a = modulo(a,n);
//    
//    while  b>0 do
//        if modulo(b,2)==1 then
//            exmod = modulo(exmod*a,n);
//        end
//        
//        b = floor(b/2);
//        a = modulo(a*a,n);
//    end
//endfunction
//
//a = 3;
//b = 13;
//n = 5;
//result = modExp(a, b, n);
//disp("Result of " + string(a) + "^" + string(b) + " mod " + string(n) + " = " + string(result));




function result = gcd(a, b)
    while b <> 0 do
        temp = b;
        b = modulo(a, b);
        a = temp;
    end
    result = a;
endfunction

// Function to compute x^y under modulo m
function result = power(x, y, m)
    if y == 0 then
        result = 1;
    else
        p = modulo(power(x, floor(y / 2), m), m);
        p = modulo((p * p), m);
        if mod(y, 2) == 0 then
            result = p;
        else
            result = modulo((x * p), m);
        end
    end
endfunction

// Function to find modular inverse of a under modulo m
// Assumption: m is prime
function modInverse(a, m)
    if gcd(a, m) <> 1 then
        disp("Inverse doesnt exist");
    else
        // If a and m are relatively prime, then
        // modulo inverse is a^(m-2) mod m
        inv = power(a, m - 2, m);
        disp("Modular multiplicative inverse is " + string(inv));
    end
endfunction


function result = gcd(a, b)
    
endfunction

a = 3;
m = 11;
modInverse(a, m);



