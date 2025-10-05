curso(mat101, 'Matem�ticas I', 8).
curso(mat102, 'Matem�ticas II', 8).
curso(fis101, 'F�sica I', 7).
curso(fis102, 'F�sica II', 7).
curso(prog101, 'Programaci�n I', 9).
curso(prog102, 'Programaci�n II', 9).
curso(algo201, 'Algoritmos y Estructuras de Datos', 9).
curso(bd201, 'Bases de Datos', 8).
curso(ia301, 'Inteligencia Artificial', 10).
curso(red301, 'Redes de Computadoras', 8).

requiere(mat102, mat101).
requiere(fis102, fis101).
requiere(prog102, prog101).
requiere(algo201, prog102).
requiere(bd201, prog102).
requiere(ia301, algo201).
requiere(red301, prog102).

:- dynamic aprobado/2.

aprobado(alumno 1, mat101).
aprobado(alumno 2, fis101).
aprobado(alumno 3, prog101).

puede_cursar(Alumno, Curso) :-
    curso(Curso, _, _),
    \+ aprobado(Alumno, Curso),
    forall(requiere(Curso, Pre), aprobado(Alumno, Pre)).

cursos_disponibles(Alumno, Cursos) :-
    findall(Curso, puede_cursar(Alumno, Curso), Cursos).

mostrar_cursos(Alumno) :-
    cursos_disponibles(Alumno, Lista),
    write('Cursos disponibles para '), write(Alumno), write(':'), nl,
    forall(member(C, Lista), (
        curso(C, Nombre, Cred),
        format('- ~w (~w cr�ditos)~n', [Nombre, Cred])
    )).








