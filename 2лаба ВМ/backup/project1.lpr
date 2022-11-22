program project1;

uses math;

const
    count=4;
    e=0.0001;
type

    TMatrix=array[1..count,1..count+1] of double;
    TVector=array[1..count] of double;

var
    matrix1:TMatrix;
    matrix2:TMatrix;
    matrix3:TMatrix;
    matrix4:TMatrix;


    umatrix:TMatrix;
    m:TVector;
    result:TVector;
    result2:TVector;
    result3:TVector;
    result4:TVector;


function A13(x,y:double):double;
begin
    Exit( x+ln(2.1-y) );
end;
function A23(x,y:double):double;
begin
    Exit( y+Power(x-1.7,3) );
end;

function A12(x,y:double):double;
begin
    Exit( -1/(2.1-y)  );
    //Exit( 1  )
end;
function A21(x,y:double):double;
begin
    Exit( 3*Power(x-1.7,2) )
end;
function A11(x,y:double):double;
begin
    Exit( 1 )
end;
function A22(x,y:double):double;
begin
    Exit( 1 )
end;






procedure init();
var i,j:integer;
begin
    matrix1[1,1]:=3.01;  matrix1[1,2]:=-0.14; matrix1[1,3]:=1.00;  matrix1[1,4]:=-0.15; matrix1[1,5]:=1.00;
    matrix1[2,1]:=-1.75; matrix1[2,2]:=1.11;  matrix1[2,3]:=0.13;  matrix1[2,4]:=-0.75; matrix1[2,5]:=0.13;
    matrix1[3,1]:=0.17;  matrix1[3,2]:=-2.11; matrix1[3,3]:=0.71;  matrix1[3,4]:=-1.71; matrix1[3,5]:=1.00;
    matrix1[4,1]:=0.21;  matrix1[4,2]:=0.21;  matrix1[4,3]:=0.35;  matrix1[4,4]:=0.33;  matrix1[4,5]:=-0.17;

    matrix2[1,1]:=0.05; matrix2[1,2]:=-0.06; matrix2[1,3]:=-0.12; matrix2[1,4]:=0.14;  matrix2[1,5]:=-2.17;
    matrix2[2,1]:=0.04; matrix2[2,2]:=-0.12; matrix2[2,3]:=0.68;  matrix2[2,4]:=0.11;  matrix2[2,5]:=1.40;
    matrix2[3,1]:=0.34; matrix2[3,2]:=0.08;  matrix2[3,3]:=-0.06; matrix2[3,4]:=0.44;  matrix2[3,5]:=-2.10;
    matrix2[4,1]:=0.11; matrix2[4,2]:=0.12;  matrix2[4,3]:=0;     matrix2[4,4]:=-0.03; matrix2[4,5]:=-0.80;


    matrix3[1,1]:=4; matrix3[1,2]:=8; matrix3[1,3]:=3; matrix3[1,4]:=15;
    matrix3[2,1]:=2; matrix3[2,2]:=7; matrix3[2,3]:=5; matrix3[2,4]:=14;
    matrix3[3,1]:=3; matrix3[3,2]:=6; matrix3[3,3]:=9; matrix3[3,4]:=18;



    //единичная матрица
    for i:=1 to length(umatrix) do
    begin
        for j:=1 to length(umatrix) do
        begin
            if i=j then
            begin
                umatrix[i,j]:=1;
            end
            else
            begin
                umatrix[i,j]:=0;
            end;
        end;
    end;
end;

procedure PrintMatrix(matrix:TMatrix;len:integer);
var i,j:integer;
begin
    for i:=1 to len do
    begin
        for j:=1 to len do
        begin
            write(matrix[i,j]:8:3);
            write(' ');
        end;
        writeln();
    end;
end;


procedure printTask1();
begin

    writeln('The Gauss method:');
    writeln('3,01*x1-0,14*x2+1,00*x3-0,15*x4=1,00');
    writeln('-1,75*x1+1,11*x2+0,13*x3-0,75*x4=0,13');
    writeln('0,17*x1-2,11*x2+0,71*x3-1,71*x4=1,00');
    writeln('0,21*x1+0,21*x2+0,35*x3+0,33*x4=0,17');
    writeln();

    write('x1':8);
    write('x2':10);
    write('x3':10);
    write('x4':10);
    write('bs':10);
    write('sum':10);

    writeln();

end;

procedure printTask2();
begin

    writeln('Simple iteration method:');
    writeln('x1=0,05*x1-0,06*x2-0,12*x3+0,14*x4-2,17');
    writeln('x2=0,04*x1-0,12*x2+0,68*x3+0,11*x4+1,40');
    writeln('x3=0,34*x1+0,08*x2-0,06*x3+0,44*x4-2,10');
    writeln('x4=0,11*x1+0,12*x2-0,03*x4-0,80');
    writeln('e=0.0001');


    writeln();
end;

procedure printTask3();
begin

    writeln('Inverse matrix method:');
    writeln('4*x1+8*x2+3*x3=15');
    writeln('2*x1+7*x2+5*x3=14');
    writeln('3*x1+6*x2+9*x3=18');
    writeln('e=0.001');


    writeln();
end;

procedure printTask4();
begin

    writeln('Newton''s method:');
    writeln('x+ln(2,1-y)=0');
    writeln('y+(x-1,7)^3=0');
    writeln();
    writeln('F1''x=1');
    writeln('F1''y=-1/(2.1-y)');
    writeln('F2''x=3*(x-1.7)^2');
    writeln('F2''y=1');
    writeln('e=0.001');


    writeln();
end;


procedure PrintResult(result:TVector; len,t:integer);
var i:integer;
begin
    for i:=1 to len do
    begin
        write(result[i]:5:t);
        write(' ');
    end;
    writeln();
end;

procedure printTable(matrix:TMatrix; len,s:integer);
var i,j:integer;
sum,b:double;
begin
    sum:=0;
    for i:=s to count do
    begin
        for j:=1 to length(matrix)+1 do
        begin
            if abs(matrix[i,j])>0.000001 then
            begin
                sum:=sum+matrix[i,j];
                write(matrix[i,j]:9:3);
                write(' ');
            end
            else
            begin
                write(' ':10);
            end;
        end;
        write(sum:8:3);
        writeln();
    end;
    sum:=0;



    writeln('                           --------------------');
    for i:=1 to length(matrix)+1 do
    begin
        if(abs(matrix[s,i])>0.000001) then
        begin
            b:=matrix[s,i]/matrix[s,s];
            write(b:10:3);
            sum:=sum+b;
        end
        else
        begin
                write(' ':10);
        end;
    end;
    if(s<>length(matrix)) then
    begin
        write(sum:9:3);
    end
    else
    begin
        b:=(matrix[s,s]+matrix[s,s+1])/matrix[s,s];

        write(b:9:3);
    end;
    writeln;



end;


procedure method1(var matrix:TMatrix;var result:TVector; len: integer; d:boolean);
var i,j,a,b:integer;
begin
    //прямой ход
    for i:=1 to len-1 do
    begin
        if d then
        begin
            printTable(matrix,4,i);
            writeln();
        end;
        //вычисляем коэффициенты
        for j:=i+1 to len do
        begin
            m[j]:=-matrix[j,i]/matrix[i,i];
        end;
        //складываем
        for a:=i+1 to len do
        begin
            for b:=1 to len+1 do
            begin
                matrix[a,b]:=matrix[a,b]+m[a]*matrix[i,b];

            end;

        end;

    end;
    if d then
        printTable(matrix,4,4);
    //обратный ход
    for i:=len downto 1 do
    begin
        result[i]:=matrix[i,len+1];
        for j:=i to len do
        begin
            if j<>i then
            begin
                result[i]:=result[i]-matrix[i,j]*result[j];
            end;
        end;
        result[i]:=result[i]/matrix[i,i];
    end;

end;


procedure method2(matrix:TMatrix;len:integer);
var i,j,n:integer;
    M:double=0;
    tmpR:TVector;
    a:double;
    s,st:double;
begin
    //Начальное приближение - вектор свободных членов
    for i:=1 to len do
    begin
        result[i]:=matrix[i,count+1];
    end;
    //норма 1
    s:=0;
    for i:=1 to len do
    begin
        st:=0;
        for j:=1 to len do
        begin
            st:=st+abs(matrix[i,j]);
        end;
        if(st>s) then
        begin
            s:=st;
        end;
    end;
    write('alpha1: = ');
    writeln(s:5:4);
    //норма 2
    s:=0;
    for i:=1 to len do
    begin
        st:=0;
        for j:=1 to len do
        begin
            st:=st+abs(matrix[j,i]);
        end;
        if(st>s) then
        begin
            s:=st;
        end;
    end;
    write('alpha2: = ');
    writeln(s:5:4);
    //норма 3
    s:=0;
    for i:=1 to len do
    begin
        for j:=1 to len do
        begin
            s:=s+matrix2[i,j]*matrix[i,j];
        end;

    end;
    write('alpha3: = ');
    writeln(sqrt(s):5:4);
    writeln();
    write('n':8);
    write('x1':10);
    write('x2':10);
    write('x3':10);
    write('x4':10);
    write('delta':10);
    writeln();

    //метод итераций
    n:=1;
    repeat
        write(n:8);
        tmpR:=result2;

        for i:=1 to len do
        begin
            result2[i]:=0;
        end;

        for i:=1 to len do
        begin
            for j:=1 to len do
            begin
                if(abs(matrix2[i,j])>0.000001) then
                begin
                    result2[i]:=result2[i]+matrix[i,j]*tmpR[j];

                end;
            end;
            if(abs(matrix2[i,len+1])>0.000001) then
            begin
                result2[i]:=result2[i]+matrix[i,len+1];
            end;

            write(result2[i]:10:5);
        end;

        //PrintResult(result2);
        M:=abs(result2[1]-tmpR[1]);

        for i:=2 to count do
        begin
            a:=abs(result2[i]-tmpR[i]);
            if(a>M) then
            begin
                M:=a;
            end;
        end;
        writeln(M:10:5);
        Inc(n);

    until (M<e);
end;

//метод обратной матрицы
procedure method3(matrix: TMatrix; umatrix:TMatrix;var result:TVector; len:integer;b:boolean);
var t:double;
    i,j,k:integer;
begin
    for k:=1 to len do
    begin
        t:=matrix[k,k];

        for j:=1 to len do
        begin
               matrix[k,j]:= matrix[k,j]/t;
               umatrix[k,j]:= umatrix[k,j]/t;
        end;

        for i:=k+1 to len do
        begin
            t:=matrix[i,k];
            for j:=1 to len do
            begin
                matrix[i,j]:=matrix[i,j] - matrix[k,j]*t;
                umatrix[i,j]:=umatrix[i,j] - umatrix[k,j]*t;
            end;
        end;

    end;

    for k:=len downto 2 do
    begin
        for i:=k-1 downto 1 do
        begin
            t:=matrix[i,k];
            for j:=1 to len do
            begin
                matrix[i,j]:=matrix[i,j]-matrix[k,j]*t;
                umatrix[i,j]:=umatrix[i,j]-umatrix[k,j]*t;
            end;
        end;
    end;
    if b then
        PrintMatrix(umatrix,3);

    //умножение матриц
    for i:=1 to len do
    begin
        result[i]:=0;
        for j:=1 to len do
        begin
            result[i]:=result[i]+umatrix[i,j]*matrix[j,len+1]
        end;
    end;

end;


procedure method4(var v:TVector);
var matrix:TMatrix;
    x,y:double;
begin
    x:=1;
    y:=1;
    writeln();
    write('x':10);
    write('y':10);
    write('dx':10);
    write('dy':10);
    write('max^2':10);
    writeln();
    repeat
        matrix[1,1]:=A11(x,y); matrix[1,2]:=A12(x,y); matrix[1,3]:=-A13(x,y);
        matrix[2,1]:=A21(x,y); matrix[2,2]:=A22(x,y); matrix[2,3]:=-A23(x,y);
        method1(matrix,v,2,false);
        x:=x+v[1];
        y:=y+v[2];
        write(x:10:4);
        write(y:10:4);
        write(v[1]:10:4);
        write(v[2]:10:4);
        write(max(v[1]*v[1],v[2]*v[2]):10:4);
        writeln();
    until max(v[1]*v[1],v[2]*v[2]) < 0.001 ;
    v[1]:=x;
    v[2]:=y;
end;



procedure detM3(m:TMatrix);
var a:double;
begin
    a:=m[1,1]*m[2,2]*m[3,3]+
        m[2,1]*m[3,2]*m[1,3]+
        m[1,2]*m[2,3]*m[3,1]-
        m[1,3]*m[2,2]*m[3,1]-
        m[1,1]*m[3,2]*m[2,3]-
        m[3,3]*m[2,1]*m[1,2];
    write('det|A|=');
    writeln(a:3:3);
end;

begin
    init();
    printTask1();
    method1(matrix1,result,4,true);
    writeln();
    //PrintMatrix();
    write('Result: ');
    PrintResult(result,4,3);
    writeln('--------------------------------------------------------------');

    printTask2();
    method2(matrix2,4);
    writeln();
    write('Result: ');
    PrintResult(result2,4,4);
    writeln('--------------------------------------------------------------');

    printTask3();
    detM3(matrix3);
    writeln('Matrix: ');
    PrintMatrix(matrix3,3);
    writeln();
    writeln('Inverse Matrix: ');
    method3(matrix3,umatrix,result3,3,true);
    writeln();
    write('Result: ');
    PrintResult(result3,3,3);
    writeln('--------------------------------------------------------------');

    printTask4();
    method4(result4);
    writeln();
    write('Result: ');
    PrintResult(result4,2,3);
    readln;

end.
