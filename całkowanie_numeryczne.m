clear all;
close all;

M = [2 4 8 16];
x1 = 0;
x2 = pi/2;
y = @(x) sin(x.*3*pi);

%Zadanie 1a
calka0 = quad(y,x1,x2)

%Zadanie 1b
%Metoda Trapezów
m_N = 2;
Ik_N = [1 1];
index = 1;
for N = M
    calka_T(index) = 0;
    x = linspace(x1,x2,N+1);
    for i = 1:1:N
        Ak = (x(i+1) - x(i)).*(Ik_N)./(m_N);
        xw = [x(i) x(i+1)];
        yw = y(xw);
        calka_T(index) = calka_T(index) + sum(Ak.*yw);
    end
    index = index + 1;
end
calka_T

%Metoda Milne'a
m_N = 90;
Ik_N = [7 32 12 32 7];
index = 1;
for N = M
    x = linspace(x1,x2,N+1);
    calka_M(index) = 0;
    for i = 1:1:N
        Ak = (x(i+1) - x(i)).*(Ik_N)./(m_N);
        xw = linspace(x(i),x(i+1),5);
        yw = y(xw);
        calka_M(index) = calka_M(index) + sum(Ak.*yw);
    end
    index = index + 1;
end
calka_M

%Metoda Weddle'a
m_N = 90;
Ik_N = [41 216 27 272 27 216 41];
index = 1;
for N = M
    x = linspace(x1,x2,N+1);
    calka_W(index) = 0;
    for i = 1:1:N
        Ak = (x(i+1) - x(i)).*(Ik_N)./(m_N);
        xw = linspace(x(i),x(i+1),7);
        yw = y(xw);
        calka_W(index) = calka_W(index) + sum(Ak.*yw);
    end
    index = index + 1;
end
calka_W
