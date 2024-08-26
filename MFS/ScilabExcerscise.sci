disp("Part A: Basic operations & arithmetic calculations:")
disp("Q1:-------------------")

x = 2.5, y = -2e-3, z = %pi
disp(x+y,x-y,x*y,x/y,x+z,x*z,y-z,y/z)

disp("---------------------------")


disp("Q2:-------------------")

s_vals = [0.5, 0.95, 1];
//result = zeros(1, length(s_vals));
for i=1:length(s_vals)
    s = s_vals(i);
    result = s^2 - 2 * s * cos(%pi/s) + 1;
    //result(i) = result; 
    disp(result);
end
//disp(result);

disp("---------------------------")

disp("Q3:-------------------")

x = 2 + 3*%i;
y = 1 - %i;
product = x * y;
division = x / y;
abs_product = abs(product);
abs_division = abs(division);
disp(product , division)
disp("Absolute value of x * y: " + string(abs_product));
disp("Absolute value of x / y: " + string(abs_division));

disp("---------------------------")

disp("Q4:-------------------")

a= 2.3, b = -2.3, c = %pi/2, x = 2/%pi, y = sqrt(3)
disp(a^2 + b*c + x)
disp(sin(c) + y/c)
disp((a+c)/(x+y))
disp(1/(cos(c)*log(x)))
disp(((a+c)^3)/b)  

disp("---------------------------")

disp("Q5:-------------------")

x = 0.5
disp(asin(x))
disp(sin(asin(x))-x)
theta = %pi/3
disp(asin(sin(theta))-theta)
theta = 5*%pi/11
disp(asin(sin(theta))-theta)

disp("---------------------------")

disp("Part B : Array, Vector and Matrix Operation Exercise")
disp("Q1:-------------------")

M = [0,1,2,3,4,5,6,7,8,9]
disp(M)
disp(M(6))
disp(M(6:8))
Y = M(6:8)+3
disp(Y)
N = flipdim(M,2)
disp(N)

disp("---------------------------")

disp("Q2:-------------------")

x_vec = [0,0.5,1,1.3,1.6,2,2.3,2.6,3,3.3,3.6,4,4.3,4.6,5,6,8,13,18]

aY = 1/2 * x_vec - 3;
bY = (4 * %e^(2/3*x_vec)) + 2;
cY = 3 * (x_vec .^ 2) + 2*x_vec + 6;
dY = sin(x_vec);
eY = sin(x_vec) .* cos(x_vec);
ansY = [aY, bY, cY, dY, eY];

disp(ansY)

disp("---------------------------")

disp("Q3:-------------------")

A = [1,2,3,4; 2,4,6,8; 1,3,5,7; 8,6,4,2];
disp("Matrix A:");
disp(A);

disp("Second column of A:");
disp(A(:,2));

disp("Third row of A:");
disp(A(3,:));

disp("Value in the last column of the last row:");
disp(A(4,4));

disp("Value in the second column of the third row:");
disp(A(3,2));

disp("---------------------------")

disp("Q4:-------------------")

A = 1:1:10;
disp("Sequence a):");
disp(A);

B = 10:-1:1;
disp("Sequence b):");
disp(B);

C = 2:2:20;
disp("Sequence c):");
disp(C);

D = 0.1:0.1:1.0;
disp("Sequence d):");
disp(D);

E = 4:-0.5:0.5
disp("Sequence e):");
disp(E);

disp("---------------------------")

disp("Q5:-------------------")

A = [5, 3, 1; 3, 4, 2; 1, 2, 4];
B = [1, 0, 1; 0, 1, 1; 1, 1, 0];
C = [1, 2, 3; 3, 2, 1];
x = [1; -1; 1];
y = [3, -1, 2];

AB = A * B;
disp("AB = ");
disp(AB);

AC_T = A * C';
disp("AC^T = ");
disp(AC_T);

CB = C * B;
disp("CB = ");
disp(CB);

Ax = A * x;
disp("Ax = ");
disp(Ax);

Ay_T = A * y';
disp("Ay^T = ");
disp(Ay_T);

Cx = C * x;
disp("Cx = ");
disp(Cx);

yB = y * B;
disp("yB = ");
disp(yB);

xy = x * y;
disp("xy = ");
disp(xy);

//yx = y' * x;
disp("yx = N.A.");
//disp(yx);

D = [C; y];
disp("Matrix D = ");
disp(D);

z = A \ x;
disp("Solution z for Az = x: ");
disp(z);

w = B \ y';
disp("Solution w for Bw = y^T: ");
disp(w);

// a) BC
disp("Is BC possible?");
disp(size(B)(2) == size(C)(1));  // False, not possible because sizes are incompatible

// b) Ay
disp("Is Ay possible?");
disp(size(A)(2) == size(y)(2));  // False, not possible because sizes are incompatible

// c) xx
disp("Is xx possible?");
disp(size(x)(2) == size(x)(1));  // False, not possible because xx is not defined

// d) A+C
disp("Is A+C possible?");
disp(size(A) == size(C));  // False, not possible because sizes are incompatible

A(2,:) = A(2,:) + (-3/5) * A(1,:);
disp("Modified A after adding (-3/5) of the first row to the second row:");
disp(A);

A(3,:) = A(3,:) + (-1/5) * A(1,:);
disp("Modified A after adding (-1/5) of the first row to the third row:");
disp(A);

disp("---------------------------")

disp("Part C : Basic Plotting")
disp("Q1:-------------------")

//x = linspace(0,4*%pi,200);
//y = linspace(0,4*%pi,200).';
//plot(x,sin(x));
//plot(x,sin(x).^2,'r--');
//plot(x,cos(x/2),'g-.');
//plot(y+0.1,[sin(y) sin(y).^2 cos(y/2)]);
//xgrid(1);


disp("---------------------------")

disp("Q2:-------------------")

//x = linspace(0, 10, 200);

//f_x = %e^(-x) .* sin(x);

//plot(x, f_x);

//xlabel('x');
//ylabel('f(x) = e^{-x} * sin(x)');
//title('Plot of f(x) = e^{-x} * sin(x)');

//xgrid(1);

disp("---------------------------")

disp("Q3:-------------------")

//x = linspace(-5,5,200);

//f_x = sin(x) ./ x;

//plot(x, f_x);

//xlabel('x');
//ylabel('f(x) = sin(x)/x');
//title('Plot of f(x) = sin(x)/x');

//xgrid(1);

disp("---------------------------")

disp("Part D : Program Control & Programming")
disp("Q:-------------------")

function y=test(x) 
    if x > 0 then 
        y = 3; 
    elseif x < 0 then 
        y = 1; 
    else 
        y = 2; 
    end 
endfunction 

function y=test2(x, n)  
// x:vector 
//n: number of elements 
    y = x(1); 
    for k = 2:n 
        y = y + x(k); 
    end 
endfunction 

function [Min, Max]=test3(x, n) 
    Min = x(1); Max = x(1); 
    for k=2:n 
        if Max < x(k) then 
            Max = x(k); 
        elseif Min > x(k) then 
            Min = x(k) 
        end 
    end 
endfunction

//mini, maxi = test3()

disp(test(0))
disp(test2([1, 2, 3, 4, 5],3))
vex = [7,3,9,5,1]
[mini, maxi] = test3(vex, length(vex))
disp(mini, maxi)

disp("---------------------------")

disp("Q2:-------------------")

function [Sum, Min, Max]=testQ2(x, n) 
     Sum = x(1); 
    for k = 2:n 
        Sum = Sum + x(k); 
    end 
    Min = x(1); Max = x(1); 
    for k=2:n 
        if Max < x(k) then 
            Max = x(k); 
        elseif Min > x(k) then 
            Min = x(k) 
        end 
    end 
endfunction

[sumi, mini, maxi] = testQ2(vex, length(vex))
disp(sumi, mini, maxi)

disp("---------------------------")

disp("Q3:-------------------")

function result = f_xy(x,y)
    if x>=0 & y>=0 then
        result = x+y
    elseif x>=0 & y<0 then
        result = x + y^2;
    elseif x < 0 & y >= 0 then
        result = x^2 + y;
    elseif x < 0 & y < 0 then
        result = x^2 + y^2;
    end
endfunction
//x = input("Enter the value of x: ");
//y = input("Enter the value of y: ");

//f_value = f_xy(x, y);s
//disp("The value of f(x, y) is: " + string(f_value));

disp("---------------------------")

disp("Q4:-------------------")

function y = f_x(x)
    y = x.^2 - 2*x - 2;
endfunction

vec  = [-1,0,1,2];
res = f_x(vec)

disp(res)

disp("---------------------------")

disp("Q5:-------------------")

deff('y=f_x(x)','y=x.^2-2*x-2')
x_list = [0, 1, 2, -1, 3.5];

result_list = f_x(x_list);

disp("f(x) for the list is: ");
disp(result_list);

disp("---------------------------")

disp("Q6:-------------------")
 
m = 1:100; 
n = m.^2; 
y = cos(n*%pi/1e4); 
plot(m, y);

disp("---------------------------")

disp("Q7:-------------------")

function y = MyTaylorExp(x, n)
y = 1+x; m = 1; xx = x; 
for k = 2:n 
    xx = xx * x; 
    m = m * k ; 
    y = y + xx/m; 
end 
endfunction 

disp( MyTaylorExp(1,5))

function y = MyTaylorExp(x, n)
y = 1+x; m = 1; xx = x; 
for k = 2:n 
    xx = xx * x; 
    m = m * k ; 
    y = y + xx/m; 
end 
endfunction 

disp( MyTaylorExp(1,5))

disp("---------------------------")

disp("Q:-------------------")

// Function for calculating sin(x) using Taylor series
function y = MyTaylorSin(x, n)
    y = x;               // Initialize y with the first term of the series (x)
    xx = x;              // Initialize xx to x, which will store the x^k term
    m = 1;               // Initialize m to 1, which will store the factorial denominator
    sign = -1;           // To alternate the sign
    
    for k = 2:2:n
        xx = xx * x^2;   // Compute the next power of x: x^(2k-1)
        m = m * (2*k-2) * (2*k-1); // Compute (2k-1)! by multiplying the current m by (2k-2) and (2k-1)
        y = y + sign * xx/m; // Add the current term with alternating sign
        sign = -sign;     // Alternate the sign
    end
endfunction

// Function for calculating cos(x) using Taylor series
function y = MyTaylorCos(x, n)
    y = 1;               // Initialize y with the first term of the series (1)
    xx = 1;              // Initialize xx to 1, which will store the x^k term
    m = 1;               // Initialize m to 1, which will store the factorial denominator
    sign = -1;           // To alternate the sign
    
    for k = 2:2:n
        xx = xx * x^2;   // Compute the next power of x: x^(2k)
        m = m * (2*k-2) * (2*k-1); // Compute (2k)! by multiplying the current m by (2k-2) and (2k-1)
        y = y + sign * xx/m; // Add the current term with alternating sign
        sign = -sign;     // Alternate the sign
    end
endfunction

// Example Usage
x_value = %pi/4;  // Example angle (45 degrees)
n_terms = 10;     // Number of terms in the series

sin_approx = MyTaylorSin(x_value, n_terms);
cos_approx = MyTaylorCos(x_value, n_terms);

disp("Approximation of sin(" + string(x_value) + ") using " + string(n_terms) + " terms: " + string(sin_approx));
disp("Approximation of cos(" + string(x_value) + ") using " + string(n_terms) + " terms: " + string(cos_approx));


disp("---------------------------")

disp("Q:-------------------")
disp("---------------------------")

disp("Q:-------------------")
disp("---------------------------")
